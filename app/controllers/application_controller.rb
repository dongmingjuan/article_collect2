class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :set_messages_count
   def set_messages_count
      @messages_count = Message.where(active: false).count
   end
end
