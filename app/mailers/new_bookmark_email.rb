class NewBookmarkEmail < ActionMailer::Base
  default from: "postmaster@sandboxc680d29e680d450f8c313aae846bdbb5.mailgun.org"
  def new_bookmark_email(bookmark)
	  @bookmark = bookmark
	  mail to: "#{bookmark.user}", subject: "Success! You did it."
  end
end
