module PlaylistsHelper
  def channel_name(id)
    Channel.find_by(id).name
  end
end
