class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    conditions = params.has_key?(:q) ? search_params : {}
    @q = Device.search(conditions)
    @devices = @q
      .result
      .order(updated_at: :desc)
    @display_frames = DisplayFrame.order(:id).inject({}){|h,c| h.merge({c.id => c.name})}
  end
  
  def search
    @q = Dvice.search(search_params)
    @devices = @q
      .result
      .order(updated_at: :desc)
  end
  
  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name,:owner_id,:display_frame_id,:temporary_content_url,:emergency_message,:play_volume,:call_volume)
    end
    # 検索フォームから受け取ったパラメータ
    def search_params
      search_conditions = %i(
        name_cont owner_id_start
      )
      params.require(:q).permit(search_conditions)
    end
end
