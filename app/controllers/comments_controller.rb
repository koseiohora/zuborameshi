class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], recipe_id: comment_params[:recipe_id], user_id: current_user.id)
    #binding.pry
    redirect_to "/recipes/#{@comment.recipe.id}"
  end

  private
  def comment_params
    params.permit(:text, :recipe_id)
  end
end
