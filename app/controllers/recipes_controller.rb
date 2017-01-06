class RecipesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @recipes = Recipe.includes(:user).order("created_at DESC").page(params[:page]).per(4)
  end

  def new
    # form_forにした場合
    # @recipe = Recipe.new
  end

  def create
    Recipe.create(image: params[:image], title: params[:recipe][:title],text: params[:recipe][:text], foods: params[:recipe][:foods], user_id: current_user.id, genre: params.require(:sample_form).permit(genre: []))[:genre]

    # unless params[:imagename].nil? then
    #   image = Image.new
    #   image.imagename = params[:imagename]
    #   image.save # ここでアップロード処理とDB保存処理が走る
    # end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy if recipe.user_id == current_user.id
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    if recipe.user_id == current_user.id
       recipe.update(recipe_params)
    end
  end

  def about
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments.includes(:user)
  end

  def ranking
    @recipes = Recipe.limit(5).order("likes_count DESC")
  end

  def search
    @recipes = Recipe.where('foods LIKE(?)', "%#{params[:keyword]}%").order("created_at DESC").page(params[:page]).per(4)
  end

  def genre
  end

  def genre_search
    @recipes = Recipe.where('genre LIKE(?)', "%#{params[:keyword]}%").order("created_at DESC").page(params[:page]).per(4)
  end

  private
  def recipe_params
    # form_forにした場合
    # params.require(recipe).permit(:title, :image, :text)
    params.permit(:title, :image, :text, :foods)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
