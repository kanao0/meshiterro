class PostCommentsController < ApplicationController
  def create
  # PostImageモデルからpost_image_idのデータ持ってきて
    post_image = PostImage.find(params[:post_image_id])
    
    # 分からんどういうこと？
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.idの略↓  
    comment = current_user.post_comments.new(post_comment_params)
    
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end
  
  

      # コメントの削除
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end  
  

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end  
end
