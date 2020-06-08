class DailyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_mailer.send_mail.subject
  #
  def send_mail
    @greeting = "ようこそ"

    mail to: User.pluck(:email), subject: "こんにちは"
  end
end
