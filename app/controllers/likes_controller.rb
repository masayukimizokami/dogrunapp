class LikesController < ApplicationController
    before_action :dogrun_params
    def create
      Like.create(user_id: current_user.id, dogrun_id: params[:id])
    end
    
    def destroy
      Like.find_by(user_id: current_user.id, dogrun_id: params[:id]).destroy
    end
    
    private
    
    def dogrun_params
      @dogrun = Dogrun.find(params[:id])
    end
end
   