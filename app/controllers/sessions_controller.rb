class SessionsController < ApplicationController
    def new 
    end
    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "You have been logged in."
        else
            flash[:alert] = "There was a problem logging you in."
            render :new
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "You have been logged out."
    end
end