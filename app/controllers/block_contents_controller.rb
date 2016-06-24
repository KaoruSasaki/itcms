class BlockContentsController < ApplicationController

  # GET /contents/new
  def new
  end

  # POST /contents
  # POST /contents.json
  def import
    if params[:file_url].blank?
      redirect_to(:back, alert: 'インポートするCSVファイルを選択してください')
    else
      num,messages = Content.import(params[:file_url])
      if messages.blank?
        redirect_to(:back, notice: "#{num.to_s}件のユーザー情報を追加 / 更新しました")
      else
        redirect_to(:back, alert: "#{(num-messages.size).to_s}件のユーザー情報を追加 / 更新しました(エラー:#{messages.size.to_s}件)")
      end
    end
  end
end
