module PlaylistsHelper
  def channel_name(id)
    Channel.find_by(id).name if id != 0  
  end
end
