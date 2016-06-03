class DeviceSubContentsController < ApplicationController
  before_action :set_device_sub_content, only: [:show, :edit, :update, :destroy]

  # GET /device_sub_contents
  # GET /device_sub_contents.json
  def index
    @device_sub_contents = DeviceSubContent.all
  end

  # GET /device_sub_contents/1
  # GET /device_sub_contents/1.json
  def show
  end

  # GET /device_sub_contents/new
  def new
    @device_sub_content = DeviceSubContent.new
  end

  # GET /device_sub_contents/1/edit
  def edit
  end

  # POST /device_sub_contents
  # POST /device_sub_contents.json
  def create
    @device_sub_content = DeviceSubContent.new(device_sub_content_params)

    respond_to do |format|
      if @device_sub_content.save
        format.html { redirect_to @device_sub_content, notice: 'Device sub content was successfully created.' }
        format.json { render :show, status: :created, location: @device_sub_content }
      else
        format.html { render :new }
        format.json { render json: @device_sub_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_sub_contents/1
  # PATCH/PUT /device_sub_contents/1.json
  def update
    respond_to do |format|
      if @device_sub_content.update(device_sub_content_params)
        format.html { redirect_to @device_sub_content, notice: 'Device sub content was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_sub_content }
      else
        format.html { render :edit }
        format.json { render json: @device_sub_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_sub_contents/1
  # DELETE /device_sub_contents/1.json
  def destroy
    @device_sub_content.destroy
    respond_to do |format|
      format.html { redirect_to device_sub_contents_url, notice: 'Device sub content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_sub_content
      @device_sub_content = DeviceSubContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_sub_content_params
      params.fetch(:device_sub_content, {})
    end
end
