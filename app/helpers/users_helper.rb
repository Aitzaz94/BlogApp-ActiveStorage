module UsersHelper
    def ban
        @user = User.find(params[:id])
        if @user.role == "admin"
            if @user.access_locked?
                @user.unlock_access!
            end
        else
            if @user.access_locked?
                @user.unlock_access!
            else
                @user.lock_access!
            end 
        end
        
        redirect_to users_path, danger: "Users Access Locked:  #{@user.access_locked?}"
    end
end