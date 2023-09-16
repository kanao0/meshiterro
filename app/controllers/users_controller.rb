class UsersController < ApplicationController
  # "edit"と"update"アクションの実行前に↓実行
  before_action :is_matching_login_user, only: [:edit, :update]
  
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
  
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end
  end
  
end
