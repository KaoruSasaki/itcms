class BlockPlaylistsController < ApplicationController

  # GET /contents/new
  def new
  end

  # POST /contents
  # POST /contents.json
  def import
    ret = Content.create_block(params[:file_url])
    
    respond_to do |format|
      if ret
        format.html { redirect_to :back, notice: 'Content file was successfully created.' }
      else
        format.html { redirect_to :back, notice: 'Failed to create content files.' }
      end
    end
  end
end
