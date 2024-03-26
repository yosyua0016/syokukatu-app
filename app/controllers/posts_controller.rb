class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # フォームから受け取ったカテゴリーをデータベースに保存する
    @post.category = params[:category]
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def index
    @latest_posts = Post.order(created_at: :desc).limit(3)
  end

  def show
    @post = Post.find(params[:id])
  end

  def reduce_salt
    @posts = Post.where(category: "減塩")
  end

  def reduce_sugar
    @posts = Post.where(category: "減糖")
  end

  def high_protein
    @posts = Post.where(category: "高タンパク質")
  end

  def obesity_prevention
    @posts = Post.where(category: "肥満対策")
  end

  def cold_prevention
    @posts = Post.where(category: "風邪対策")
  end

  def others
    @posts = Post.where(category: "その他")
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end