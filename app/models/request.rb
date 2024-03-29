class Request < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :biography, presence: true, length: { maximum: 500 }

  after_update :new_user

  def set_confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s if confirm_token.blank?
  end

  def accept!
    self.statut = 'accepted'
    save
    contract
  end

  def contract
    UserMailer.contract_acceptance(self).deliver_now
  end

  def self.accept!
    list = Request.confirmed
    list.first.accept! unless list.empty?
  end

  def self.accepted
    Request.where(statut: 'accepted')
  end

  def self.unconfirmed
    Request.where(statut: 'unconfirmed')
  end

  def self.confirmed
    Request.where(statut: 'confirmed').order(created_at: :asc)
  end

  def self.expired
    Request.where(statut: 'expired')
  end

  def new_user
    if contract_accepted
      @u = User.new(email: email, password: 'password123')
      @u.save!
      UserMailer.profil_user_mail(@u).deliver_now
    end
  end
end
