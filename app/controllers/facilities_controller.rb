class FacilitiesController < ApplicationController

  before_filter :authenticate_user!, :check_if_admin
  before_action :set_facility, only: [:show, :edit, :update, :destroy]

  def check_if_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

  def index
    add_breadcrumb "Facility", :facilities_path
  	@facilities = Facility.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.create(facility_params)

    respond_to do |format|
      if @facility.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @facility.errors.full_messages,
                            status: :unprocessable_entry }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @facility.errors.full_messages,
                                   status: :unprocessable_entry }
      end
    end
  end

  def destroy
    @facility.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to facilities_url}
      format.json { head :no_content}
    end
  end

private

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:name,
                                     :address,
                                     {:areas => []},
                                     {:programs => []})
  end
end
