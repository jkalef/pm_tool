class Member < ActiveRecord::Base
  
  #--ASSOCIATIONS--------------------------------------
  belongs_to :user
  belongs_to :project
end
