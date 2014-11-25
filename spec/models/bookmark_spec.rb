require 'rails_helper'

RSpec.describe Bookmark, :type => :model do
	it "Creates bookmark from email params" do
		user = create(:user)
		newbookmark = Bookmark.create_from_email subject: '#sports', sender: 'ldippo421@gmail.com', :'body-plain' => 'www.deadspin.com'
		expect(newbookmark.url).to eq "http://www.deadspin.com"
		expect(newbookmark.tags.first.name).to eq 'sports'
		expect(newbookmark.user).to eq user
	end


end
