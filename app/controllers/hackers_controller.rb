class HackersController < ApplicationController
  before_filter :authorize, :except => [:new, :create, :show, :index]
  before_filter :parse_full_name, :only => [:update]

  def index
    @hackers = Hacker.all

    respond_to do |format|
      format.html
      format.json { render json: @hackers }
    end
  end

  def new
    @hacker = Hacker.new

    respond_to do |format|
      format.html
      format.json { render json: @hacker }
    end
  end

  def create
    @hacker = Hacker.new(params[:hacker])
    if @hacker.save
      session[:hacker_id] = @hacker.id
      redirect_to @hacker, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @hacker = Hacker.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @hacker }
    end
  end

  def edit
    @hacker = current_hacker

    respond_to do |format|
      format.html
      format.json { render json: @hacker }
    end
  end

  def update
    @hacker = current_hacker

    respond_to do |format|
      if @hacker.update_attributes(params[:hacker])
        format.html { redirect_to @hacker, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hacker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hacker = Hacker.find(params[:id])
    @hacker.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private

  def parse_full_name
    if params[:hacker].has_key?(:full_name)
      full_name = params[:hacker].delete(:full_name)
      names = full_name.split(/ /)
      params[:hacker][:last_name] = names.last
      params[:hacker][:first_name] = names[0..-2].join(" ")
    end
  end
end