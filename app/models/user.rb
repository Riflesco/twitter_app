class User < ApplicationRecord
  validates :name, presence: { message: "must be given please" }, format: { with: /\A\D*\z/, message: "should contain only letters", :allow_blank => true }
  validates :email, presence: true
  #validates :age ,presence:true, :numericality => { greater_than: 0, less_than: 100 }
  #validates :gender, presence:true ,format: { with: /\A\D+\z/, message: "should contain only letters"  ,:allow_blank => true }
  #validates :phone_number, numericality: { only_integer: true }

  has_many :posts, dependent: :destroy
  has_many :comments

  has_many :follower_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :follower_relationships, source: :followed
  has_many :followers, through: :followed_relationships, source: :follower
  has_secure_password
  # follows a user
  def follow(other_user)
    following << other_user
  end

  # unfollows a user
  def unfollow(other_user)
    following.delete(other_user)
  end

  # returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end
end
