class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :only=>[:new, :create]
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

=begin
  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end
=end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.user_id = @current_user.id

    respond_to do |format|
      if @project.save

        access_token = current_user.token

        call_url = @base_url + "repos/" + @current_user.nickname + "/" + @project.name + "/contributors?access_token=" + access_token
        logger.debug "REPO INFO CALL URL" + call_url
        result = Nestful.get(call_url)
        #logger.debug "REPO INFO: #{result.inspect}"
        result = JSON.parse(result)
        result.each do |c|
          new_c = Contributor.new :project_id=>@project.id, :nickname=>c["login"], :avatar_url=>c["avatar_url"]
          new_c.save
        end


        call_url = @base_url + "repos/" + @current_user.nickname + "/" + @project.name + "/commits?access_token=" + access_token
        logger.debug "COMMIT CALL URL" + call_url
        result = Nestful.get(call_url)
        #logger.debug "COMMITS: #{result.inspect}"

        result = JSON.parse(result)
        result.each do |c|
          new_c = Commit.new(:project_id=>@project.id,
            :commit_timestamp=>DateTime.parse(c["commit"]["author"]["date"]),
            :author_name => c["commit"]["author"]["name"],
            :commit_msg => c["commit"]["message"])
          new_c.save
        end

        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project.event }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

=begin

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end
=end

end
