FactoryBot.define do
  factory :poll do
    title { "Sample Poll" }

    # Add associations or nested attributes if necessary
    after(:create) do |poll|
      create_list(:answer, 3, poll: poll) # Creates 3 associated answers
    end
  end
end
