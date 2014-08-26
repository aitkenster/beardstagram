require "rails_helper"

RSpec.describe PurchaseConfirmation, :type => :mailer do
  describe "invoice" do
    let(:mail) { PurchaseConfirmation.invoice }

    it "renders the headers" do
      expect(mail.subject).to eq("Invoice")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
