class Song
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :author, type: String

  embeds_many :tags
end
