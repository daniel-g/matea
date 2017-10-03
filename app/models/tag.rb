class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  scope :confirmed, ->{ where(tagged_by_expert: true) }

  field :type, type: String
  field :value, type: String
  field :tagged_by_expert, type: Boolean
  belongs_to :user

  embedded_in :song
end
