class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def index
    @latest_posts = Post.order(created_at: :desc).limit(3)
  end

  def show
    @post = Post.find(params[:id])
  end

  def reduce_salt
    @posts = Post.where(category_id: 1)
  end

  def reduce_sugar
    @posts = Post.where(category_id: 2)
  end

  def high_protein
    @posts = Post.where(category_id: 3)
  end

  def obesity_prevention
    @posts = Post.where(category_id: 4)
  end

  def cold_prevention
    @posts = Post.where(category_id: 5)
  end

  def others
    @posts = Post.where(category_id: 6)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :image)
  end
end