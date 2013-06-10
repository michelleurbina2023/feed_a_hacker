class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    respond_to do |format|
      format.html
      format.json { render json: @projects }
    end
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html
      format.json { render json: @hacker }
    end
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      session[:project_id] = @project.id
      redirect_to @project, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def edit
    @project = current_hacker

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def update
    @project = current_hacker

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end