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

    params[:areas][:id].each do |area|
      if !area.empty?
        @facility.facility_areas.build(:area_id => area)
      end
    end

    params[:programs][:id].each do |program|
      if !program.empty?
        @facility.facility_programs.build(:program_id => program)
      end
    end

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
    @area_select = FacilityArea.where(facility_id: @facility.id).pluck(:area_id)
    @program_select = FacilityProgram.where(facility_id: @facility.id).pluck(:program_id)
  end

  def update

    params[:areas][:id].each do |area|
      if !area.empty?
        @facility.facility_areas.build(:area_id => area)
      end
    end

    params[:programs][:id].each do |program|
      if !program.empty?
        @facility.facility_programs.build(:program_id => program)
      end
    end

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
    params.require(:facility).permit!
  end
end
