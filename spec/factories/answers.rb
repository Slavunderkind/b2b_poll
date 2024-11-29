FactoryBot.define do
  factory :answer do
    name { "Sample Answer" }
    votes { 0 }             
    association :poll      
  end
end
