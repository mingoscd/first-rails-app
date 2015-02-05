class Person < ActiveRecord::Base
	has_many :participations
	has_many :projects, through: :participations

	def self.show_people
		order("created_at DESC")
	end
end
