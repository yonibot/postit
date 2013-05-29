class CommentsController < ApplicationController

  before_filter :require_user, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    @comment.user_id = session[:user_id]

    if @comment.save
      flash[:notice] = "Comment has been saved."
      redirect_to post_path(@post)
    else
      # TODO - handle failure

    end
  end

  def update
  end

  def show
  end

  def edit
  end

  def index
  end

  def vote
    @comment = Comment.find(params[:id])
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
    
    respond_to do |format|
      format.html do
        # if @vote.save... don't care cause no validation
      end
      format.js  #renders vote.js.erb template
    end
  end


end






    # @post = Post.new(params[:post])

    # if @post.save
    #   flash[:notice] = "Post was created."
    #   redirect_to root_path
    # else
    #   render :new
    # end