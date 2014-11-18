class NewBookmarkEmail < ActionMailer::Base
  default from: "info@app31249869.mailgun.org"
  def new_bookmark_email(bookmark)
	  @bookmark = bookmark
	  mail to: "#{bookmark.user.email}", subject: "Success! You did it."
  end
end
