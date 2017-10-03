class Song
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :author, type: String

  belongs_to :contributor, class_name: 'User'
  embeds_many :tags

  def tag(type, user, *taggings)
    taggings.each do |tagging|
      tags.create(type: type, user: user, value: tagging, tagged_by_expert: user.is_expert?)
    end
  end

  def taggings
    tags.pluck(:value).uniq.map(&:to_sym)
  end

  def expert_taggings
    tags.confirmed.pluck(:value).uniq.map(&:to_sym)
  end

  def tagged_by_expert? tagging
    tags.confirmed.where(value: tagging).any?
  end

  def tag_count(tagging)
    tags.where(value: tagging).count
  end

  def tag_contributors(tagging)
    tags.where(value: tagging).map &:user
  end
end
