class AccountsController < ApplicationController
    before_action :set_account
    before_action :authenticate_account!

    def index
        #user feed
        @accounts = current_account.following
    end

    def show
        #user profile
        @account = Account.find(params[:id])
        @posts = @account.posts
    end

    #---------------------------------
    
    def follow
        current_account.send_follow_request_to(@account)
        @account.accept_follow_request_of(current_account)
        redirect_to request.referrer
    
    end
    
    def unfollow
    
        current_account.unfollow(@account)
        redirect_to request.referrer
    
    end
    
    def accept
    
        current_account.accept_follow_request_of(@account)
        redirect_to request.referrer
    end
    
    
    def decline
        current_account.decline_follow_request_of(@account)
        redirect_to request.referrer
    end
    
    def cancel
        current_account.remove_follow_request_for(@account)
        redirect_to request.referrer
    end

    def set_account
        @account = Account.find(params[:id])
    end

    
end
