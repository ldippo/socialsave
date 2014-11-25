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
	
	def self.create_from_email(params)
		puts "subject = #{params[:subject]}"
		puts "url = #{params[:'body-plain']}"
		
		t = params[:subject].split(' ').map do |n|
			Tag.where(name: n.strip.delete('#')).first_or_create!
		end

		url = params[:'body-plain'].strip
		email = params[:sender]
		user = User.find_by(email: email)
		Bookmark.create!( tags: t, url: url, user: user )

	end
end
