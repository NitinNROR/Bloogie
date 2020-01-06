class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  has_many :articles

  def username
  	return self.email.split('@')[0].capitalize

  end

end
