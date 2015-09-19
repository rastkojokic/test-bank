class TransferManager
  def self.execute_transfer(from_account_number, to_account_number, transfering_amount)
    requested_transfer = RequestedTransfer.new(from_account_number, to_account_number, transfering_amount)

    if requested_transfer.same_bank?
      Transfers::Intra.execute(requested_transfer)
    else
      Transfers::Inter.execute(requested_transfer)
    end
  end
end
