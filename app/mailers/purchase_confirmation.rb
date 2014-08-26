class PurchaseConfirmation < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_confirmation.invoice.subject
  #
  def invoice(user)
    @greeting = "Hi"
    @user = user
    mail to: user.email
  end
end
