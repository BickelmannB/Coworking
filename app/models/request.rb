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

  def accept!(request)
    @request = request
    request = Request.find(params[:id])
    if request
      request.statut = 'accepted'
      request.save!
    else
      flash[:error] = "Sorry, Request does not exist"
      redirect_to root_url
    end
  end

  def accepted
    @requests = Request.where(statut: 'accepted')
  end

  def unconfirmed
    @requests = Request.where(statut: 'unconfirmed')
  end

  def confirmed
    @requests = Request.where(statut: 'confirmed')
  end

  def expired
    @requests = Request.where(statut: 'expired')
  end

  private

  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end
end
