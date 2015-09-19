FactoryGirl.define do
  factory :bank do
    name "Some bank"
  end

  factory :account do
    balance 100000
  end
end
