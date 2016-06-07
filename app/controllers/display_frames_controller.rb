class DisplayFramesController < ApplicationController
  before_action :set_display_frame, only: [:show, :edit, :update, :destroy]

  # GET /display_frames
  # GET /display_frames.json
  def index
    @display_frames = DisplayFrame.all
  end

  # GET /display_frames/1
  # GET /display_frames/1.json
  def show
  end

  # GET /display_frames/new
  def new
    @display_frame = DisplayFrame.new
  end

  # GET /display_frames/1/edit
  def edit
  end

  # POST /display_frames
  # POST /display_frames.json
  def create
    @display_frame = DisplayFrame.new(display_frame_params)

    respond_to do |format|
      if @display_frame.save
        format.html { redirect_to @display_frame, notice: 'Display frame was successfully created.' }
        format.json { render :show, status: :created, location: @display_frame }
      else
        format.html { render :new }
        format.json { render json: @display_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /display_frames/1
  # PATCH/PUT /display_frames/1.json
  def update
    respond_to do |format|
      if @display_frame.update(display_frame_params)
        format.html { redirect_to @display_frame, notice: 'Display frame was successfully updated.' }
        format.json { render :show, status: :ok, location: @display_frame }
      else
        format.html { render :edit }
        format.json { render json: @display_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /display_frames/1
  # DELETE /display_frames/1.json
  def destroy
    @display_frame.destroy
    respond_to do |format|
      format.html { redirect_to display_frames_url, notice: 'Display frame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_display_frame
      @display_frame = DisplayFrame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def display_frame_params
      params.require(:display_frame).permit(:name,:frame_pattern,:image_url)
    end
end
