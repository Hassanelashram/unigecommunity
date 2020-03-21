class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit,:show, :update, :destroy, :create, :new]


  # GET /posts
  # GET /posts.json
  def index
    @user = User.count
    @q = Post.ransack(params[:q])
    @posts = @q.result.order("created_at DESC").limit(4)
    # @posts = Post.order("created_at DESC").limit(4)
    @category = Category.where(parent_id: nil).limit(4)
    @category = @category.order("created_at DESC")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user = User.name
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @categories = Category.order('category ASC').where(parent_id: nil)
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, success: 'Votre contributions est maintenant en ligne!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, success: 'Votre contributions a été mis a jour.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, success: 'Votre contributions a été supprimer.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id,:document, :document_two, :picture)
    end
end
