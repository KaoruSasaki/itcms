class Content < ActiveRecord::Base
  has_many :playlist_contents
  has_many :playlists, :through => :playlist_contents

  class << self
    def find_sti_class(type_name)
      type_name.camelize.constantize
    end
 
    def sti_name
      name.underscore
    end
    
    def create_block(file)
      if file.blank?
        false
      else
        true
      end
    end
  end
end
