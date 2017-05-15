class User < ApplicationRecord
  after_create_commit :set_rating
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :user_listings
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  def email_required?
    false
  end

  def email_changed?
    false
  end


  def set_rating

    self.update_attribute(:average_rating, 0)
    self.update_attribute(:total_rating, 0)
  end
end
