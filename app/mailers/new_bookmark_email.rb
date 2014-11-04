class NewBookmarkEmail < ActionMailer::Base
  default from: "postmaster@sandboxc680d29e680d450f8c313aae846bdbb5.mailgun.org"
  def new_record_notification(record)
	  @record = record
	  mail to: "recipient@MYDOMAIN.com", subject: "Success! You did it."
  end
end
