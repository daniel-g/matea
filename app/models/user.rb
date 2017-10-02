class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :is_expert, type: Boolean

  has_many :songs, foreign_key: :contributor_id
end
