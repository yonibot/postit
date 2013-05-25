class PostsController < ApplicationController
  before_filter :require_user, only: [:new, :create]

  def find_username(user_id)
    @namename = User.find(user_id)
  end


  def index
    @posts = Post.all
    @firstPost = Post.first
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = session[:user_id]

    if @post.save
      flash[:notice] = "Post was created."
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all  
    @comment = @post.comments.new(params[:comment])

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      @postTitle = @post[:title]
      flash[:notice] = "Post was edited"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


end


