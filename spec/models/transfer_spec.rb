require "spec_helper"

describe Transfer do
  it { is_expected.to have_db_column(:amount).of_type(:decimal) }
  it { is_expected.to have_db_column(:type).of_type(:string) }
end
