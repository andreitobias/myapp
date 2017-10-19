class Contact < ActiveRecord::Base
  validates :name, presence: { message: "Please enter a valid name" }, length: { maximum: 50 }, allow_blank: false 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i	
  validates :email, presence: { message: "Please enter a valid email" }, length: { maximum: 255 }, allow_blank: false,
                    format: {message: "Please enter  a valid email" , with: VALID_EMAIL_REGEX }
  validates :url, presence: { message: "Please enter  a valid url" }, length: { maximum: 50 }, allow_blank: false
  has_one :admin
  has_one :report
end  