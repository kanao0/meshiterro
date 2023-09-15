class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user 
  has_many :post_comments, dependent: :destroy 
  has_many :favorites, dependent: :destroy  
  
  # 画像が設定されない場合はapp/assets/imagesに格納されている
  # no_image.jpgという画像をデフォルト画像としてActiveStorageに格納し、
  # 格納した画像を表示するというもの
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  # favorited_by?メソッドを作成
  # 引数で渡されたユーザidが
  # Favoritesテーブル内に存在（exists?）するかどうかを調べる。
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end  
  
end
