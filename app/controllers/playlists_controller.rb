class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    conditions = params.has_key?(:q) ? search_params : {}
    @q = Playlist.search(conditions)
    @playlists = @q
      .result
      .order(updated_at: :desc)
    @channels = Channel.order(:id).inject({}){|h,c| h.merge({c.id => c.name})}
  end
  
  def search
    @q = Playlist.search(search_params)
    @playlists = @q
      .result
      .order(updated_at: :desc)
  end
  
  # GET /playlists/1
  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
    @selected_contents ||= []
    @selected_contents.push(Content.find(params[:content_id].to_i)) unless params[:content_id].blank?
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @content, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:name,:channel_id,:play_start_date,:play_end_date,:release_date)
    end
    # 検索フォームから受け取ったパラメータ
    def search_params
      search_conditions = %i(
        name_cont channel_name_cont play_start_date_gteq play_end_date_lteq release_date_gteq
      )
      params.require(:q).permit(search_conditions)
    end
end
