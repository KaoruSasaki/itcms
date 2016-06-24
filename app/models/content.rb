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

  class << self
    def create_block(file)
      if file.blank?
        false
      else
        true
      end
    end
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

        # CSVの行情報をHASHに変換、不要Key項目の除外
        table = Hash[[row.headers, row.fields].transpose]
        update_hash = table.to_hash.slice(*table.to_hash.except("id", "lock_version", "created_at", "updated_at").keys)

        # 登録済みコンテンツ情報取得。
        # 登録されてなければ作成
        content = Content.find_or_create_by(code: table["code"])
        binding.pry
        # コンテンツ情報更新
        begin
          content.update_attributes!(update_hash)
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
