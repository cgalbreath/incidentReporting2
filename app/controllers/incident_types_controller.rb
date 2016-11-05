class IncidentTypesController < ApplicationController

  before_filter :authenticate_user!, :check_if_admin
  before_action :set_incident_type, only: [:show, :edit, :update, :destroy]

  def check_if_admin
    if signed_in?
      raise 'Only admins allowed!' unless current_user.admin?
    else
      # or you can use the authenticate_user! devise provides to only allow signed_in users
      raise 'Please sign in!'
    end
  end

  def index
    add_breadcrumb "Incident Types", :incident_types_path
  	@incident_types = IncidentType.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @incident_type = IncidentType.new
  end

  def create
    @incident_type = IncidentType.create(incident_type_params)

    respond_to do |format|
      if @incident_type.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @incident_type.errors.full_messages,
                            status: :unprocessable_entry }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @incident_type.update(incident_type_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @incident_type.errors.full_messages,
                                   status: :unprocessable_entry }
      end
    end
  end

  def destroy
    @incident_type.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to incident_types_url}
      format.json { head :no_content}
    end
  end

private

  def set_incident_type
    @incident_type = IncidentType.find(params[:id])
  end

  def incident_type_params
    params.require(:incident_type).permit(:name)
  end
end
