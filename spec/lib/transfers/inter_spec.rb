require "spec_helper"

describe Transfers::Inter do
  describe ".execute" do
    let(:from_account_number) { "123" }
    let(:to_account_number) { "xyz" }
    let(:from_account) { FactoryGirl.create(:account, :number => "123", :balance => 42) }
    let(:to_account) { FactoryGirl.create(:account, :number => "xyz", :balance => 24) }
    let(:requested_transfer) { RequestedTransfer.new(from_account.number, to_account.number, transfering_amount) }

    context "amount exceeds maximum limit" do
      let(:transfering_amount) { 10000 }

      it "raises exception" do
        expect{Transfers::Inter.execute(requested_transfer)}.to raise_error(Exception)
      end
    end

    context "transaction failed" do
      let(:transfering_amount) { 100 }

      before do
        allow(Transfers::Inter).to receive(:rand) { 40 }
      end

      it "raises exception" do
        expect{Transfers::Inter.execute(requested_transfer)}.to raise_error(Exception)
      end
    end

    context "transaction success" do
      let(:transfering_amount) { 10 }

      before do
        allow(Transfers::Inter).to receive(:rand) { 20 }
        Transfers::Inter.execute(requested_transfer)
      end

      it "creates transaction" do
        expect(Transfer.last).to be_present
      end

      it "decreases from account balance with comission" do
        expect(Account.find_by_number(from_account_number).balance).to eq(32 - Transfers::Inter::COMMISSION)
      end

      it "increases to account balance" do
        expect(Account.find_by_number(to_account_number).balance).to eq(34)
      end
    end
  end
end
