class Project < ActiveRecord::Base
	has_many :entries
	has_many :participations
	has_many :people, through: :participations

	has_attached_file :logo, styles: {:medium => '300x300>', :thumb => '100x100>'}
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :description, presence: true, length: { maximum: 50 }



	def self.iron_find id 
		where("id = ?",id)
	end
	def self.clean_old
		where("created_at < ?", Time.now.midnight - 7.days).destroy_all
	end
	def self.last_created_projects number
		order("created_at DESC").limit(number)
	end

	def total_hours_in_month
		from = Date.new(Date.today.year,Date.today.month,1)
		to = Date.new(Date.today.year,Date.today.month, -1)
		total = 0
		minutes = 0
		entries.where(date: from..to).each do |entry|
			total += entry.hours
			minutes += entry.minutes
		end
		total += minutes / 60
		total.to_s + " h " + (minutes % 60).to_s + " min"
	end
end
