class Playlist < ActiveRecord::Base
  has_many :playlist_contents
  has_many :contents, :through => :playlist_contents
  belongs_to :channel
end
