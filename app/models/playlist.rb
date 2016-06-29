class Playlist < ActiveRecord::Base
  has_many :playlist_contents
  has_many :contents, :through => :playlist_contents
  belongs_to :channel
  
  def convert_date
    self.validity_start_date = self.validity_start_date.gsub('/','')
    self.validity_end_date = self.validity_end_date.gsub('/','')
  end
  # CSVファイルの内容をDBに登録する
  def self.import(playlist_headers_file_url, playlist_details_file_url)

    imported_num = 0
    messages = []

    # 文字コード変換のためにKernel#openとCSV#newを併用。
    open(playlist_headers_file_url.path, 'r:cp932:utf-8', undef: :replace) do |f1|
      csv1 = CSV.new(f1, :headers => :first_row)
      csv1.each do |row1|
        next if row1.header_row?

        # CSVの行情報をHASHに変換、不要Key項目の除外
        table = Hash[[row1.headers, row1.fields].transpose]
        update_hash = table.to_hash.slice(*table.to_hash.except("id", "lock_version", "created_at", "updated_at").keys)
        update_hash = update_hash.merge({"type" => "IticketPlaylist"})

        # CSVのchannel_idからChannel名取得
        channel = Channel.find_by(code: table["channel_id"])
        update_hash = update_hash.merge({"channel_id" => channel.id}) if channel != nil

        # 明細ファイル内のレコードを明細tableに整形
        detail_table = []
        open(playlist_details_file_url.path, 'r:cp932:utf-8', undef: :replace) do |f2|
          csv2 = CSV.new(f2, :headers => :first_row)
          csv2.each do |row2|
            next if row2.header_row?
            # CSVの行情報をHASHに変換
            table2 = Hash[[row2.headers, row2.fields].transpose]
            detail_table << table2["c_code"] if table["code"] == table2["p_code"]
          end
        end
        # Contentのtableデータ作成
        contents = Content.where(code: detail_table)
        sorted_contents = detail_table.collect {|code| contents.detect {|c| c.code == code}}

        # 登録済プレイリスト情報取得。
        # 登録されてなければ作成
        playlist = Playlist.find_or_create_by(code: table["code"])
        # コンテンツ情報更新
        begin
          playlist.update_attributes!(update_hash)
          playlist.playlist_contents.delete_all
          sorted_contents.each_with_index{|c,idx| PlaylistContent.create({playlist_id: playlist.id, content_id: c.id, display_order: idx+1})}
        rescue => e
          messages << e.message
        end

        imported_num += 1
      end
    end

    # 更新件数を返却
    return imported_num,messages

  end
end
