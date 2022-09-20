class MainController < ApplicationController
    def index
        flash[:notice] = "Welcome to the main page!"
        flash[:alert] = "This is an alert!"
    end
end