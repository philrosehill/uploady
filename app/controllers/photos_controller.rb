class PhotosController < ApplicationController
  def index
  	@photos = Photo.all
  end

  def new
  	@photo = Photo.new
  end

  def create
	@photo = Photo.new(photo_params)  	

	if @photo.save
		redirect_to photos_path
	else
		render :new
	end
  end

  private
  # ^only the current instance can call this method V

  def photo_params
	params.require(:photo).permit(:filename, :caption)  	
  end

end
