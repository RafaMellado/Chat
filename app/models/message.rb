class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :text, type: String
  field :user, type: Object
  field :room, type: Object

  belongs_to :user
  belongs_to :room 

  validates :text, length: { maximum: 200 }, presence: true

end
