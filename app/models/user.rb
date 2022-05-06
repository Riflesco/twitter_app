class User < ApplicationRecord
  validates :name, presence: { message: "must be given please" }, format: { with: /\A\D*\z/, message: "should contain only letters", :allow_blank => true }
  validates :email, presence: true
  #validates :age ,presence:true, :numericality => { greater_than: 0, less_than: 100 }
  #validates :gender, presence:true ,format: { with: /\A\D+\z/, message: "should contain only letters"  ,:allow_blank => true }
  #validates :phone_number, numericality: { only_integer: true }

  has_secure_password
end
