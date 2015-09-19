module Transfers
  class AccountTransfer
    def self.create_transfer(requested_transfer)
      Transfer.create(
        :transfer_type => "intra", 
        :amount => requested_transfer.transfering_amount, 
        :outgoing_account_id => requested_transfer.from_account.id,
        :incoming_account_id => requested_transfer.to_account.id)
    end

    def self.wire_the_money(requested_transfer, commission = 0)
      from_account = requested_transfer.from_account
      from_account.balance = from_account.balance - requested_transfer.transfering_amount - commission
      from_account.save!

      to_account = requested_transfer.to_account
      to_account.balance = to_account.balance + requested_transfer.transfering_amount
      to_account.save!
    end
  end
end
