class ProfilesController < ApplicationController
  def index
    search_query = params[:query]
    query = Account.ransack(username_cont: search_query)
    @accounts = query.result(distince: true)
  end
  
end
