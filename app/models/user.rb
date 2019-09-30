class User < ApplicationRecord
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,    type: String

    validates :name, length: { maximum: 40, minimum: 4 }, presence: true, uniqueness: true

    has_many :messages
end
