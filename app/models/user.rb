class User < ActiveRecord::Base

  #--ASSOCIATIONS-----------------------------------------
  has_many :projects
  has_many :tasks 
  has_many :discussions
  has_many :task_comments 
  has_many :comments

  #many to many through member model
  has_many :members, dependent: :destroy
  has_many :users, through: :members


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #use this to display the name of the user
  def display_name
     if first_name || last_name
      "#{first_name} #{last_name}".strip.squeeze(" ")
    else
      email
    end 
  end
end
