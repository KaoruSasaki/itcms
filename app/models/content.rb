class Content < ActiveRecord::Base
  has_many :playlist_contents
  has_many :playlists, :through => :playlist_contents
  has_many :content_tags
  has_many :tags, :through => :content_tags

  validates :type, presence: true
  validates :name, presence: true
  validates :url, presence: true
  validates :playing_sec, numericality: {only_integer: true}  
  validates :validity_start_date, presence: true
  validates :validity_end_date, presence: true
  
  before_save :convert_date

  def convert_date
    self.validity_start_date = self.validity_start_date.gsub('/','')
    self.validity_end_date = self.validity_end_date.gsub('/','')
  end

# CSVファイルの内容をDBに登録する
  def self.import(file_url)

    imported_num = 0
    messages = []

    # 文字コード変換のためにKernel#openとCSV#newを併用。
     open(file_url.path, 'r:cp932:utf-8', undef: :replace) do |f|
      csv = CSV.new(f, :headers => :first_row)
      csv.each do |row|
        next if row.header_row?
        
        tag_table = []
        # CSVの行情報をHASHに変換、不要Key項目の除外
        table = Hash[[row.headers, row.fields].transpose]
        update_hash = table.to_hash.slice(*table.to_hash.except("id", "tag1", "tag2", "tag3", "tag4", "tag5", "lock_version", "created_at", "updated_at").keys)
        update_hash = update_hash.merge({"type" => (update_hash["type"] == "1")? "IticketContent" : "MedicalContent"})
        # 1レコード内のtagをtableに整形
        for i in 1..5 do
          tag_table << table["tag#{i}"] unless table["tag#{i}"].nil?
        end
        tags = Tag.where(code: tag_table)
        sorted_tags = tag_table.collect {|code| tags.detect {|t| t.code == code}}

        # 登録済みコンテンツ情報取得。
        # 登録されてなければ作成
        content = Content.find_or_create_by(code: table["code"])
        # コンテンツ情報更新
        begin
          content.update_attributes!(update_hash)
          content.content_tags.delete_all
          sorted_tags.each_with_index{|t,idx| ContentTag.create({content_id: content.id, tag_id: t.id, display_order: idx+1})}
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
