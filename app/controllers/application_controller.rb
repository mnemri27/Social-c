class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        current_account
    end



end
