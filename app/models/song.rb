class Song
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :author, type: String

  belongs_to :contributor, class_name: 'User'
  embeds_many :tags

  def tag(type, user, *taggings)
  end
end
