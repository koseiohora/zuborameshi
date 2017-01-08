class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, recipe_id: params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, recipe_id: params[:id])
    @like.destroy
    @recipe = Recipe.find(params[:id])
  end
end
