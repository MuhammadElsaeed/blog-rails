# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def show
  @comment = Comment.new
  @post = Post.find(params[:id])
end

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    p 'updating'
    @post = Post.find(params[:id])
    
    if @post.update(params.permit(:title, :content))
      redirect_to '/posts'
    else
      render 'edit'
    end  end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def create_comment
    @post = Post.find params[:id]
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.post_id = params[:id]
    if @comment.save
      redirect_to post_path(id: @comment.post_id )
    else
      render :show
    end
  end

  def delete_comment
    Comment.find(params[:comment_id]).destroy
    
    redirect_to post_path(id: params[:id] )
  end
end
