class ProjectsController < ApplicationController
before_filter :load_hacker

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
    @project = current_hacker.projects.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
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
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def update
    @project = current_hacker.projects.find(params[:id]) rescue nil

    unless @project
      redirect_to root_url, :error => 'You cannot update this project!'
    end

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = current_hacker.projects.find(params[:id]) rescue nil

    unless @project
      redirect_to root_url, :error => 'You cannot delete this project!'
    end

    @project.destroy

    respond_to do |format|
      format.html { redirect_to_project_url }
      format.json { head :no_content }
    end
  end

  private

  def load_hacker
    @hacker = Hacker.find(params[:hacker_id]) rescue nil
  end
end