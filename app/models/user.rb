class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :admin
  before_update :pass_changed

  def pass_changed
    self.already_logged = true if changed.include? 'encrypted_password'
  end
end
