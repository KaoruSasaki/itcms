class PlaylistContent < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :content
end
