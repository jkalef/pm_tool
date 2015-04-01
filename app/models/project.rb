class Project < ActiveRecord::Base

	#---ASSOCIATIONS-----------------------------
	has_many :discussions, dependent: :destroy


	#VALIDATIONS----------------------------------
	validates :title, presence: true,
	                  uniqueness: true

	validates :description, :due_date, presence: true

	#----------------------------------------------


	#CLASS METHODS----------------------------------
	#search_term will be users input from the search bar
	#will pass it through as params[:search_term]
	def self.search_result(search_word)
		Project.where("title ILIKE ? OR description ILIKE ?", "%#{search_word}%", 
																	"%#{search_word}%")
	end

	#------------------------------------------------


end
