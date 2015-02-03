class Project < ActiveRecord::Base
	has_many :entries
	def self.iron_find id 
		where("id = ?",id)
	end
	def self.clean_old
		where("created_at < ?", Time.now.midnight - 7.days).destroy_all
	end
	def self.last_created_projects number
		order("created_at DESC").limit(number)
	end
end
