class Request < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :biography, presence: true, length: { maximum: 500 }

  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def accept!
    self.statut = 'accepted'
    save!
    contract
  end

  def contract
    UserMailer.contract_acceptance(self).deliver_now
    redirect_to root_path
  end

  def self.accept!
    list = Request.confirmed
    list.first.accept! unless list.empty?
  end

  def self.accepted
    @requests = Request.where(statut: 'accepted')
  end

  def self.unconfirmed
    @requests = Request.where(statut: 'unconfirmed')
  end

  def self.confirmed
    @requests = Request.where(statut: 'confirmed').order(created_at: :asc)
  end

  def self.expired
    @requests = Request.where(statut: 'expired')
  end

  private

  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end
end
