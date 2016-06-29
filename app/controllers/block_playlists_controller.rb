class BlockPlaylistsController < ApplicationController

  # GET /contents/new
  def new
  end

  # POST /contents
  # POST /contents.json
  def import
    if params[:playlist_headers_file_url].blank? or params[:playlist_details_file_url].blank?
      redirect_to(:back, alert: '提供プレイリストのCSVファイルを選択してください')
    else
      num,messages = Playlist.import(params[:playlist_headers_file_url], params[:playlist_details_file_url])
      if messages.blank?
        redirect_to(:back, notice: "#{num.to_s}件のプレイリスト情報を追加 / 更新しました")
      else
        redirect_to(:back, alert: "#{(num-messages.size).to_s}件のプレイリストを追加 / 更新しました(エラー:#{messages.size.to_s}件)")
      end
    end
  end
end
