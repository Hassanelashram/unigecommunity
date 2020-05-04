class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_level_of_category, only: [:create, :update]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create, :new]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.where(parent_id: nil, child_category_parent_id: nil).order('category ASC')
  end

  def sub_categories
    parent_cat_id = params[:category_id].to_i
    @categories = Category.where(parent_id: parent_cat_id).select(:id, :category)
    # options = []
    # if @categories.present?
    #   @categories.each do |cat|
    #     options << { id: cat.id, text: cat.category}
    #   end
    # end
    respond_to do |format|
      format.json { render json: @categories }
    end
  end

  def child_sub_categories
    parent_cat_id = params[:category_id].to_i
    @categories = Category.where(child_category_parent_id: parent_cat_id).select(:id, :category)
    # options = []
    # if @categories.present?
    #   @categories.each do |cat|
    #     options << { id: cat.id, text: cat.category}
    #   end
    # end
    respond_to do |format|
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @q = Post.ransack(params[:q])

  end

  # GET /categories/new
  def new
    if true
    @category = Category.new
  else
    redirect_to root_url
    flash[:warning] = "Sorry but there is nothing to see there"
  end
  @categories = Category.all
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    @categories = Category.all
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, success: 'Categories publier' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @category.parent_id = nil
    @category.child_category_parent_id = nil
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, success: "Categories mis a jour" }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      debugger
      @category = Category.find(params[:id])
    end

    def set_level_of_category
      if params[:category][:parent_id].present?
        cat_level = Category.find(params[:category][:parent_id])
        if cat_level.check_level_of_category? == 1
          params[:category].delete(:parent_id)
          params[:category].merge!(:child_category_parent_id => cat_level.id.to_s)
        end
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:category, :catimage, :parent_id, :child_category_parent_id)
    end
end
