class UsersController < ApplicationController
  def show
  #Userモデルのデータ探してーデータ入れる,箱は@userって名前にしたよ
    @user = User.find(params[:id])
# 特定のユーザ（@user）に関連付けられた投稿の1ページ分の決められたデータ
# （post_images.page(params[:page])）を取得して@post_imagesに渡す
    @post_images = @user.post_images.page(params[:page])   
  end

  def edit
    @user = User.find(params[:id])
  end
  

  def update
    # updateされたデータを入れる箱つくる
    @user = User.find(params[:id])
    # ユーザーのアップデート  
    @user.update(user_params)
    # ユーザー詳細ページへ 
    redirect_to user_path  
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end  
  
end
