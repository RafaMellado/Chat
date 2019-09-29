class User < ApplicationRecord
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name,    type: String

    validates :name, length: { maximum: 40 }, presence: true

    has_many :messages
end
