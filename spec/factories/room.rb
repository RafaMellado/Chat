FactoryBot.define do
    factory :room do
        name { Faker::Games::WorldOfWarcraft.hero }
    end
  end