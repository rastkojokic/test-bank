module Transfers
  class Intra < AccountTransfer
    def self.execute(requested_transfer)
      create_transfer(requested_transfer)
      wire_the_money(requested_transfer)
    end
  end
end
