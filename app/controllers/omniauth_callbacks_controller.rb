class OmniauthCallbacksController < ApplicationController
    def twitter
        Rails.logger.info auth        

        twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
        twitter_account.update(
            name: auth.info.name,
            image: auth.info.image,
            token: auth.credentials.token,
            secret: auth.credentials.secret,
        )
        if twitter_account.persisted?
            flash[:notice] = "Twitter account successfully added"
        else
            flash[:alert] = "Twitter account could not be added"
        end
        redirect_to twitter_accounts_path
    end
    def auth
        request.env["omniauth.auth"]
    end
end