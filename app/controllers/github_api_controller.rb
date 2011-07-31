class GithubApiController < ApplicationController
  
  before_filter :authenticate_user!, :only=>[:repo_list]
  
  def repo_list
    access_token = current_user.token
    call_url = @base_url + "user/repos?access_token=" + access_token
    logger.debug call_url
    result = Nestful.get(call_url)
    respond_to do |format|
      format.json do
        render :json => JSON.parse(result)
      end
    end
  end

end
