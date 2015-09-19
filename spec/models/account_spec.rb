require "spec_helper"

describe Account do
  it { is_expected.to have_db_column(:balance).of_type(:decimal) }
  it { is_expected.to have_db_column(:number).of_type(:string) }

  it { is_expected.to have_many(:outgoing_transfers) }
  it { is_expected.to have_many(:incoming_transfers) }
end
