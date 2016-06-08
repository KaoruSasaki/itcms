class Content < ActiveRecord::Base
  has_many :playlist_contents
  has_many :playlists, :through => :playlist_contents
  has_many :content_tags
  has_many :tags, :through => :content_tags

  validates :type, presence: true
  validates :name, presence: true
  validates :url, presence: true
  validates :validity_start_date, presence: true
  validates :validity_end_date, presence: true
  
  before_save :convert_date

  def convert_date
    self.validity_start_date = self.validity_start_date.gsub('/','')
    self.validity_end_date = self.validity_end_date.gsub('/','')
  end

  class << self
    def create_block(file)
      if file.blank?
        false
      else
        true
      end
    end
  end
end
