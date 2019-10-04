class Room < ApplicationRecord
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,    type: String

    validates :name, length: { minimum: 4, maximum: 40 }, presence: true, uniqueness: true

    has_many :messages

    def as_json(*args)
        res = super
        res["id"] = res.delete("_id").to_s
        res
    end
end
