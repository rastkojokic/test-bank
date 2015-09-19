class RequestedTransfer
  attr_reader :from_account, :to_account, :transfering_amount

  def initialize(from_account_number, to_account_number, transfering_amount)
    @from_account = Account.find_by_number(from_account_number)
    @to_account = Account.find_by_number(to_account_number)
    @transfering_amount = transfering_amount
  end

  def same_bank?
    @from_account.bank_id == @to_account.bank_id
  end

  def from_account
    @from_account
  end

  def to_account
    @to_account
  end

  def transfering_amount
    @transfering_amount
  end
end
