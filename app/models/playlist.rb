class Playlist < ActiveRecord::Base
  has_many :playlist_contents
  has_many :contents, :through => :playlist_contents
  belongs_to :channel
  
  def convert_date
    self.validity_start_date = self.validity_start_date.gsub('/','')
    self.validity_end_date = self.validity_end_date.gsub('/','')
  end
  
end
