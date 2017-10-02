require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_has_songs_as_contributor
    user = create(:user)
    song = user.songs.create(attributes_for(:song))
    assert_includes user.reload.songs, song
    assert_equal song.reload.contributor, user
  end
end
