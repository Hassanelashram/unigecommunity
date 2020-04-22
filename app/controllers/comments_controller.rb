class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:show, :update, :destroy, :create, :new]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit( :body))
    @comment.user_id = current_user.id
    if @comment.save
    flash[:success] = "Commentaire publier"
    redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
    flash[:danger] = "Commentaire supprimer"
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
    if @comment.destroy
    flash[:danger] = "Commentaire supprimer"
    end
  end

private



end
