class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  # 投稿データの保存
  def create
    # データを入れる箱(空のモデル)を作る
    @post_image = PostImage.new(post_image_params)
    # ★今ログインしているユーザーのidを表示
    @post_image.user_id = current_user.id
    
    # PostImageモデルへ保存
    if @post_image.save
    # 投稿一覧画面へリダイレクトindex処理へ
      redirect_to post_images_path
    else
      # 保存できなかったら投稿フォームへ移動
      render :new
    end
  end  

  def index
# データ表示したい、データを入れた箱(@post_images)を作る
    # @post_images = PostImage.all
    # 1ページ分の決められた数のデータだけを、新しい順に取得する
    @post_images = PostImage.page(params[:page])
  end

  def show
    # Post_Imageモデルのデータみつけてきて～データの箱は@Post_Imageって名前    
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new  
    
  end
  
  
  def destroy
    # 削除するデータを取得
    post_image = PostImage.find(params[:id])
    # 削除
    post_image.destroy
    # 投稿一覧画面へ
    redirect_to post_image_path 
  end
  
  
  
    # 投稿データのストロングパラメータ
    # フォームで入力されたデータが、
      # 投稿データとして許可されているパラメータかどうかをチェック
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
