class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@comments = Comment.where(photo_id: params[:photo_id])
  	@photo = Photo.find(params[:photo_id])
  end

  def new
  	@photo = Photo.find(params[:photo_id])
  	@comment = Comment.new
  end

  def create
  	@photo = Photo.find(params[:photo_id])
  	@comment = Comment.new(comment_params)
  	@comment.user = current_user
  	@comment.photo = @photo

  	if @comment.save
  		redirect_to photos_path, notice: "Your reply has been saved."
  	else
  		render :new
  	end
  end

  private

  def comment_params
  	params.require(:comment).permit(:body)
  	
  end
end
