class ContentTagsController < ApplicationController
  before_action :set_content_tag, only: [:show, :edit, :update, :destroy]

  # GET /content_tags
  # GET /content_tags.json
  def index
    @content_tags = ContentTag.all
  end

  # GET /content_tags/1
  # GET /content_tags/1.json
  def show
  end

  # GET /content_tags/new
  def new
    @content_tag = ContentTag.new
  end

  # GET /content_tags/1/edit
  def edit
  end

  # POST /content_tags
  # POST /content_tags.json
  def create
    @content_tag = ContentTag.new(content_tag_params)

    respond_to do |format|
      if @content_tag.save
        format.html { redirect_to @content_tag, notice: 'Content tag was successfully created.' }
        format.json { render :show, status: :created, location: @content_tag }
      else
        format.html { render :new }
        format.json { render json: @content_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_tags/1
  # PATCH/PUT /content_tags/1.json
  def update
    respond_to do |format|
      if @content_tag.update(content_tag_params)
        format.html { redirect_to @content_tag, notice: 'Content tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_tag }
      else
        format.html { render :edit }
        format.json { render json: @content_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_tags/1
  # DELETE /content_tags/1.json
  def destroy
    @content_tag.destroy
    respond_to do |format|
      format.html { redirect_to content_tags_url, notice: 'Content tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_tag
      @content_tag = ContentTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_tag_params
      params.fetch(:content_tag, {})
    end
end
