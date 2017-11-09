class LabelsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
   def index
     @labels = Label.all
   end
   def new
   end
   def create
     if @label.save
       redirect_to labels_path
     else
       render :new
     end
   end
   def edit
   end
   def update
     if @label.update(label_params)
       redirect_to labels_path
     else
       render :edit
     end
   end
   def destroy
     @label.destroy
     redirect_to labels_path
   end
   def show
   end
   private
   def label_params
     params.require(:label).permit(:name)
   end
end
