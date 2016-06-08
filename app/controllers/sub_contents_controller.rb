class SubContentsController < ApplicationController
  before_action :set_sub_content, only: [:show, :edit, :update, :destroy]

  # GET /sub_contents
  # GET /sub_contents.json
  def index
    conditions = params.has_key?(:q) ? search_params : {}
    @q = SubContent.search(conditions)
    @sub_contents = @q
      .result
      .order(updated_at: :desc)
  end

  def search
    @q = SubContent.search(search_params)
    @sub_contents = @q
      .result
      .order(updated_at: :desc)
  end
  
  # GET /sub_contents/1
  # GET /sub_contents/1.json
  def show
  end

  # GET /sub_contents/new
  def new
    @sub_content = SubContent.new
  end

  # GET /sub_contents/1/edit
  def edit
  end

  # POST /sub_contents
  # POST /sub_contents.json
  def create
    @sub_content = SubContent.new(sub_content_params)

    respond_to do |format|
      if @sub_content.save
        format.html { redirect_to @sub_content, notice: 'Sub content was successfully created.' }
        format.json { render :show, status: :created, location: @sub_content }
      else
        format.html { render :new }
        format.json { render json: @sub_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_contents/1
  # PATCH/PUT /sub_contents/1.json
  def update
    respond_to do |format|
      if @sub_content.update(sub_content_params)
        format.html { redirect_to @sub_content, notice: 'Sub content was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_content }
      else
        format.html { render :edit }
        format.json { render json: @sub_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_contents/1
  # DELETE /sub_contents/1.json
  def destroy
    @sub_content.destroy
    respond_to do |format|
      format.html { redirect_to sub_contents_url, notice: 'Sub content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_content
      @sub_content = SubContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_content_params
      params.require(:sub_content).permit(:name,:url)
    end
    # 検索フォームから受け取ったパラメータ
    def search_params
      search_conditions = %i(
        name_cont url_cont
      )
      params.require(:q).permit(search_conditions)
    end
end
