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

  private


  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end

end
