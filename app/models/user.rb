class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :no_ic, uniqueness: true, presence: true, numericality: { only_integer: true, length: { is: 12 }, message: "Angka sahaja dan 12 digit tanpa tanda '-' " }

  has_many :borangs
         def validated?
          validated
        end
      
        def admin?
          admin
        end

        has_many :payments, through: :borangs

        def latest_payment
          payments.order(id: :desc).first
        end
end
