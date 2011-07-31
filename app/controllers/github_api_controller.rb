class GithubApiController < ApplicationController
  
  before_filter :authenticate_user!, :only=>[:repo_list]
  
  def repo_list
    access_token = current_user.token
    call_url = @base_url + "users/" + @current_user.nickname + "/repos"
    logger.debug call_url
    result = Nestful.get(call_url)
    respond_to do |format|
      format.json do
        render :json => JSON.parse(result)
      end
    end
  end

end
