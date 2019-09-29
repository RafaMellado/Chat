class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :text, type: String
  field :user_id, type: String
  field :room_id, type: String

  belongs_to :user
  belongs_to :room 

  validates :text, length: { maximum: 200 }, presence: true
end
