class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin, only: [:index, :validate_user]
    def index
     
        @users = User.all
      
    end

    def validate_user
        user = User.find(params[:id])
        user.update(validated: true)
        redirect_to all_users_path, notice: "Akaun berjaya disahkan."
      end
    
      private
    
      def require_admin
        unless current_user.admin?
          flash[:notice] = "Anda tidak dibenarkan mengakses laman ini. Sila hubungi pentadbir sistem."
          redirect_to root_path
        end
      end
end
