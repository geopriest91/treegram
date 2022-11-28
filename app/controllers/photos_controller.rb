class PhotosController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    if params[:photo] == nil

      flash[:alert] = "Please upload a photo"
      redirect_to :back
    else
    @photo = Photo.create(photo_params)
      @photo.user_id = @user.id
      @photo.title = photo_params[:title]
      @photo.save
      flash[:notice] = "Successfully uploaded a photo with title #{@photo.title}"
      redirect_to user_path(@user)
    end
  end

  def new
    @user = User.find(params[:user_id])
    @photo = Photo.create(params[:title])
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
