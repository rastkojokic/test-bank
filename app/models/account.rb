class Account < ActiveRecord::Base
  has_many :outgoing_transfers, :foreign_key => :outgoing_account_id, :class => Transfer
  has_many :incoming_transfers, :foreign_key => :incoming_account_id, :class => Transfer
end
