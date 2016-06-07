class BlockContentsController < ApplicationController

  # GET /contents/new
  def new
  end

  # POST /contents
  # POST /contents.json
  def import
    ret = Content.create_block(params[:file_url])
    
    respond_to do |format|
      if ret
        format.html { redirect_to :back, notice: 'Succeeded in shelf registration of content.' }
      else
        format.html { redirect_to :back, notice: 'Failed to shelf registration of content.' }
      end
    end
  end
end
