class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, type: String
  field :value, type: String
  field :tagged_by_expert, type: Boolean
  belongs_to :user

  embedded_in :song
end
