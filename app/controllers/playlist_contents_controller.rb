class PlaylistContentsController < ApplicationController
  before_action :set_playlist_content, only: [:show, :edit, :update, :destroy]

  # GET /playlist_contents
  # GET /playlist_contents.json
  def index
    @playlist_contents = PlaylistContent.all
  end

  # GET /playlist_contents/1
  # GET /playlist_contents/1.json
  def show
  end

  # GET /playlist_contents/new
  def new
    @playlist_content = PlaylistContent.new
  end

  # GET /playlist_contents/1/edit
  def edit
  end

  # POST /playlist_contents
  # POST /playlist_contents.json
  def create
    @playlist_content = PlaylistContent.new(playlist_content_params)

    respond_to do |format|
      if @playlist_content.save
        format.html { redirect_to @playlist_content, notice: 'Playlist content was successfully created.' }
        format.json { render :show, status: :created, location: @playlist_content }
      else
        format.html { render :new }
        format.json { render json: @playlist_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlist_contents/1
  # PATCH/PUT /playlist_contents/1.json
  def update
    respond_to do |format|
      if @playlist_content.update(playlist_content_params)
        format.html { redirect_to @playlist_content, notice: 'Playlist content was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist_content }
      else
        format.html { render :edit }
        format.json { render json: @playlist_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlist_contents/1
  # DELETE /playlist_contents/1.json
  def destroy
    @playlist_content.destroy
    respond_to do |format|
      format.html { redirect_to playlist_contents_url, notice: 'Playlist content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist_content
      @playlist_content = PlaylistContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_content_params
      params.fetch(:playlist_content, {})
    end
end
