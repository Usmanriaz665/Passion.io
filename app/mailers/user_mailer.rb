class UserMailer < ApplicationMailer
  default from: 'stylemyle.test@gmail.com'
  layout 'mailer'

  def self.inform_user
    ActionMailer::Base.mail(to: 'fixyourcell.ca@gmail.com', subject: 'Test Subject', body: "Test Mail Body").deliver_later
  end
end
