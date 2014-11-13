class Bookmark < ActiveRecord::Base
	validates_presence_of :user

	belongs_to :user
	has_and_belongs_to_many :tags
	has_many :favorites

	def self.tagged_with(name)
		Tag.find_by_name!(name).bookmarks
	end
	def url
		"http://#{self[:url]}"
	end
	def tag_list
		tags.map(&:name).join(", ")
	end

	def tag_list=(names)
		self.tags = names.split(",").map do |n|
			Tag.where(name: n.strip).first_or_create!
		end
	end
end
