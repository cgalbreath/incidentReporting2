class AreasController < ApplicationController

  before_filter :authenticate_user!, :check_if_admin
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  def check_if_admin
    if signed_in?
      raise 'Only admins allowed!' unless current_user.admin?
    else
      # or you can use the authenticate_user! devise provides to only allow signed_in users
      raise 'Please sign in!'
    end
  end

  def index
    add_breadcrumb "Area", :areas_path
  	@areas = Area.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.create(area_params)

    respond_to do |format|
      if @area.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @area.errors.full_messages,
                            status: :unprocessable_entry }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @area.update(area_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @area.errors.full_messages,
                                   status: :unprocessable_entry }
      end
    end
  end

  def destroy
    @area.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to areas_url}
      format.json { head :no_content}
    end
  end

private

  def set_area
    @area = Area.find(params[:id])
  end

  def area_params
    params.require(:area).permit(:name)
  end
end
