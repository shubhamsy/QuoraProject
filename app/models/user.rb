class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions
  has_many :answers
  has_many :follows, as: :followable   


  def get_name
  	if self.first_name.present? || self.last_name.present?
  		"#{self.first_name} #{self.last_name}" 
  	else
  		"#{self.email}"
  	end
  end            
end
