FactoryBot.define do
    factory :message do
        text { Faker::Games::WorldOfWarcraft.quote }
        user_id { User.last.id }
        room_id { Room.last.id }
    end
  end