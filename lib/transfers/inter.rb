module Transfers
  class Inter < AccountTransfer
    MAX_TRANSFERING_AMOUNT = 1000
    COMMISSION = 5

    def self.execute(requested_transfer)
      check_transfering_amount(requested_transfer)
      perfrom_transfer(requested_transfer)
    end

    private

    def self.check_transfering_amount(requested_transfer)
      if requested_transfer.transfering_amount > MAX_TRANSFERING_AMOUNT
        raise Exception
      end
    end

    def self.perfrom_transfer(requested_transfer)
      check_transfer_availability
      create_transfer(requested_transfer)
      wire_the_money(requested_transfer, COMMISSION)
    end

    def self.check_transfer_availability
      if rand(100) > 30
        raise Exception
      end
    end
  end
end
