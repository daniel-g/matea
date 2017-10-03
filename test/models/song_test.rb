require 'test_helper'

class SongTest < ActiveSupport::TestCase
  def test_tags
    user_a = create(:user)
    user_b = create(:user)
    song = create(:song)
    song.tag(:instruments, user_a, :saxophone, :guitar, :piano)
    song.tag(:instruments, user_b, :guitar)
    assert_same_elements song.taggings, [:saxophone, :guitar, :piano]
    assert_equal song.tag_count(:saxophone), 1
    assert_equal song.tag_count(:guitar), 2
    assert_same_elements song.tag_contributors(:guitar), [user_a, user_b]
  end

  def test_tags_by_experts
    user = create(:user)
    expert = create(:user, is_expert: true)
    song = create(:song)
    song.tag(:instruments, user, :saxophone, :guitar, :piano)
    song.tag(:instruments, expert, :guitar)
    assert_same_elements song.taggings, [:saxophone, :guitar, :piano]
    assert_same_elements song.expert_taggings, [:guitar]
    assert song.tagged_by_expert? :guitar
    refute song.tagged_by_expert? :piano
  end
end
