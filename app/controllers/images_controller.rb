class ImagesController < ApplicationController
    before_action :set_image, only: %i[ show edit update destroy ]

    def index
      @images = Image.order(created_at: :desc).limit(15)
      @comments = Comment.all
      @likes = Like.all
    end
  
    def show
      @image = Image.find(params[:id])
      @user = User.all
    end
  
    def new
      @image = Image.new
    end
  
    def create
      @image = current_user.images.build(image_params)
      if @image.save
        redirect_to @image, notice: 'Image uploaded!'
      else
        render :new
      end
    end

    def destroy
        @image.destroy
    
        respond_to do |format|
          format.html { redirect_to images_url, notice: "Post was successfully deleted." }
          format.json { head :no_content }
        end
    end

    private

    def set_image
        @image = Image.find(params[:id])
    end
  
    def image_params
      params.require(:image).permit(:image, :description)
    end
  end