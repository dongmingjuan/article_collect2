class PicturesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    def index
       @pictures = Picture.all
       @pictures = @pictures.where(name: /#{params[:name]}/) unless params[:name].blank?
       @pictures = @pictures.where(type: /#{params[:type]}/) unless params[:type].blank?
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
      params.require(:picture).permit(:photo, :name, :type)
    end
end
