#encoding:utf-8
class UserMailer < ActionMailer::Base
  default from: "cube@headflow.net"

  def send_email(to_user, subject, body, footer, url)
    @m_subject = subject
    @m_body = body
    @footer = footer
    @url = url
    
    mail to: to_user.email, subject: @m_subject
  end
end
