class ApplicationMailer < ActionMailer::Base

  include Resque::Mailer

end
