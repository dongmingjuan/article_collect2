class PicturesController < ApplicationController
    before_action :authenticate_user!
    def index
       @pictures = Picture.all
    end
    def new
       @picture = Picture.new
    end
    def create
      @picture = Picture.new(picture_params)
      if @picture.save
        redirect_to pictures_path
      else
        render :new
      end
    end
    private
    def picture_params
      params.require(:picture).permit(:photo)
    end
end
