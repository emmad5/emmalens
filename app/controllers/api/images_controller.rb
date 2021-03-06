class Api::ImagesController < ApplicationController
  

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    
    if @image.save
      render :show
    else
      render json: @images.errors.full_messages, status: 422
    end
  end

  def show
    @image = Image.find(params[:id])

    if @image
      render :show
    else
      render json: @image.errors.full_messages, status: 422
    end
  end

  def update
    @image = current_user.images.find(params[:id])

    if @image.update(image_params)
      render :show
    else
      render json: @image.errors.full_messages, status: 422
    end
  end

  def destroy
    @image = Image.find(params[:id])

    if @image.destroy
      render :show
    else
      render json: @image.errors.full_messages, status: 422
    end
  end

  private
  def image_params
    params.require(:image).permit(:caption, :photo)
  end
end