class ApplicationMailer < ActionMailer::Base
  default from: Settings.nvtrung_mail
  layout "mailer"
end
