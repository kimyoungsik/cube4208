require "spec_helper"

describe UserMailer do
  describe "entry_update" do
    let(:mail) { UserMailer.entry_update }

    it "renders the headers" do
      mail.subject.should eq("Entry update")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
