require "spec_helper"

describe Transfers::Intra do
  describe ".execute" do
    let(:from_account_number) { "123" }
    let(:to_account_number) { "xyz" }
    let(:transfering_amount) { 10 }
    let(:from_account) { FactoryGirl.create(:account, :number => "123", :balance => 42) }
    let(:to_account) { FactoryGirl.create(:account, :number => "xyz", :balance => 24) }
    let(:requested_transfer) { RequestedTransfer.new(from_account.number, to_account.number, transfering_amount) }

    before do
      Transfers::Intra.execute(requested_transfer)
    end

    it "creates transfer" do
      expect(Transfer.last).to be_present
    end

    it "decreases from account balance" do
      expect(Account.find_by_number(from_account_number).balance).to eq(32)
    end

    it "increases to account balance" do
      expect(Account.find_by_number(to_account_number).balance).to eq(34)
    end
  end
end
