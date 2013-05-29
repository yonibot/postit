class PostsController < ApplicationController
  before_filter :require_user, except: [:index, :show]

  def index
    @posts = Post.all
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
    @comment = @post.comments.new
  end

  def edit
    @post = Post.find(params[:id])
    unless session[:user_id] == @post.user_id
    # flash[:error] = "You don't have access to that."
      redirect_to root_path
    end
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

  def vote
    @post = Post.find(params[:id])
    Vote.create(voteable: @post, user: current_user, vote: params[:vote])
    
    respond_to do |format|
      format.html do
        # if @vote.save... don't care cause no validation
      end
      format.js  #renders vote.js.erb template
    end

  end


end


