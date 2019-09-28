class Room < ApplicationRecord
    include Mongoid::Document

    field :name,    type: String

    validates :name, length: { maximum: 40 }, presence: true

    has_many :messages
end
