require "spec_helper"

describe TransferManager do
  describe ".execute_transfer" do
    let(:account_number_1) { "123" }
    let(:account_number_2) { "xyz" }
    let(:transfering_amount) { 30000 }

    context "account numbers from the same bank" do
      before do
        bank_1 = FactoryGirl.create(:bank)

        FactoryGirl.create(:account, :bank_id => bank_1.id, :number => account_number_1)
        FactoryGirl.create(:account, :bank_id => bank_1.id, :number => account_number_2)

        allow(Transfers::Inter).to receive(:execute) { double }
      end

      it "executes intra-bank transfer" do
        expect(Transfers::Intra).to receive(:execute)

        TransferManager.execute_transfer(account_number_1, account_number_2, transfering_amount)
      end
    end

    context "account numbers from different bank" do
      before do
        bank_1 = FactoryGirl.create(:bank)
        bank_2 = FactoryGirl.create(:bank)

        FactoryGirl.create(:account, :bank_id => bank_1.id, :number => account_number_1)
        FactoryGirl.create(:account, :bank_id => bank_2.id, :number => account_number_2)

        allow(Transfers::Intra).to receive(:execute) { double }
      end

      it "executes inter-bank transfer" do
        expect(Transfers::Inter).to receive(:execute)

        TransferManager.execute_transfer(account_number_1, account_number_2, transfering_amount)
      end
    end
  end
end
