class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: String

  embedded_in :song
end
