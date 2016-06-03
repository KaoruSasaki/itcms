class ContentDetailsController < ApplicationController
  before_action :set_content_detail, only: [:show, :edit, :update, :destroy]

  # GET /content_details
  # GET /content_details.json
  def index
    @content_details = ContentDetail.all
  end

  # GET /content_details/1
  # GET /content_details/1.json
  def show
  end

  # GET /content_details/new
  def new
    @content_detail = ContentDetail.new
  end

  # GET /content_details/1/edit
  def edit
  end

  # POST /content_details
  # POST /content_details.json
  def create
    @content_detail = ContentDetail.new(content_detail_params)

    respond_to do |format|
      if @content_detail.save
        format.html { redirect_to @content_detail, notice: 'Content detail was successfully created.' }
        format.json { render :show, status: :created, location: @content_detail }
      else
        format.html { render :new }
        format.json { render json: @content_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_details/1
  # PATCH/PUT /content_details/1.json
  def update
    respond_to do |format|
      if @content_detail.update(content_detail_params)
        format.html { redirect_to @content_detail, notice: 'Content detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_detail }
      else
        format.html { render :edit }
        format.json { render json: @content_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_details/1
  # DELETE /content_details/1.json
  def destroy
    @content_detail.destroy
    respond_to do |format|
      format.html { redirect_to content_details_url, notice: 'Content detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_detail
      @content_detail = ContentDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_detail_params
      params.fetch(:content_detail, {})
    end
end
