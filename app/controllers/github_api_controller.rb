class GithubApiController < ApplicationController
  
  before_filter :authenticate_user!, :only=>[:repo_list]
  
  def repo_list
    access_token = current_user.token
    call_url = @base_url + "/user/repos?access_token=" + access_token

    result = Nestful.get(call_url)
    respond_to do |format|
      format.json do
        render :json => JSON.parse(result)
      end
    end
  end

  def repo_commits
    project_id = params[:id]
    @project = Project.includes(:user).find(project_id)
    access_token = current_user.token

    call_url = @base_url + "/repos/" + @project.user.nickname + "/" + @project.name + "/commits?access_token=" + access_token

    result = Nestful.get(call_url)
    logger.debug result.inspect
    respond_to do |format|
      format.json do
        render :json => JSON.parse(result)
      end
    end
  end

  def repo_info
    project_id = params[:id]
    @project = Project.includes(:user).find(project_id)
    access_token = current_user.token

    call_url = @base_url + "/repos/" + @project.user.nickname + "/" + @project.name + "?access_token=" + access_token

    result = Nestful.get(call_url)
    unless result.nil?
      logger.debug result.inspect
    end
  end

  # get images of all github commiters
  def repo_committers_info
  end

  # get and reset github info in out db (contributors etc)
  def reset_github_info
  end

  def set_api
    @base_url = "https://api.github.com/"
  end

end
