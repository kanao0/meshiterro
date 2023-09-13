class UsersController < ApplicationController
  def show
  #Userモデルのデータ探してーデータ入れる箱は@userって名前にしたよ
    @user = User.find(params[:id])
# 特定のユーザ（@user）に関連付けられた投稿全てのデータ（.post_images）を取得し
# @post_imagesに渡す(個人が投稿したもの全てを表示)
    @post_images = @user.post_images    
  end

  def edit
  end
end
