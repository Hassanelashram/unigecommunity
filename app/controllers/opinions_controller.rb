class OpinionsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @opinion = @topic.opinions.create(params[:opinion].permit( :body))
    @opinion.user_id = current_user.id
    if @opinion.save
    flash[:success] = "Opinion publier"
    redirect_to topic_path(@topic)
    end
  end


    def destroy
      @topic = Topic.find(params[:topic_id])
      @opinion = @topic.opinions.find(params[:id])
      @opinion.destroy
      redirect_to topic_path(@topic)
      if @opinion.destroy
      flash[:danger] = "Opinion supprimer"
      end
    end

    def show
      @topic = Topic.find(params[:topic_id])
      @opinion = @topic.opinions.find(params[:id])
      @opinion.destroy
      redirect_to topic_path(@topic)
      if @opinion.destroy
      flash[:danger] = "Opinion supprimer"
      end
    end
end
