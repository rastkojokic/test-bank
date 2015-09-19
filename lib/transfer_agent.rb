class TransferAgent
  NUMBER_OF_RETRIES = 100

  def self.execute_transfer(from_account_number, to_account_number, transfering_amount)
    if transfering_amount > Transfers::AccountTransfer::MAX_TRANSFERING_AMOUNT 
      execute_transfer(from_account_number, to_account_number, transfering_amount - 1000)
      transfering_amount = 1000
    end

    perform_transfer(from_account_number, to_account_number, transfering_amount)
  end

  private

  def self.perform_transfer(from_account_number, to_account_number, transfering_amount)
    try = 0
    begin
      try += 1
      TransferManager.execute_transfer(from_account_number, to_account_number, transfering_amount)
    rescue Exception
      if try < NUMBER_OF_RETRIES
        retry
      end
    end
  end
end
