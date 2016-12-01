class IncidentsController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  def index
    add_breadcrumb "Incidents", :incidents_path
    @incidents = Incident.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    add_breadcrumb "Incidents", :incidents_path
    add_breadcrumb params[:id], :incident_path
    @incident = Incident.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        :template => 'incidents/show.pdf.erb',
        :layout => 'pdf.html.erb',
        :show_as_html => params[:debug].present?
      end
    end
  end

  def new
    @incident = Incident.new
    @incident.injuries.build
    @incident.thefts.build
    @incident.vehicle_accidents.build
    @incident.property_damages.build
    @incident.behaviourals.build
    @incident.misconducts.build
    @sysDateTime = DateTime.current().strftime("%m/%d/%Y %I:%M %p")
  end

  def create
    @incident = Incident.create(incident_params)

    respond_to do |format|
      if @incident.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @incident.errors.full_messages,
                            status: :unprocessable_entry }
      end
    end
  end

  def edit
    @sysDateTime = @incident.date_reported
    if Injury.where(incident_id: @incident.id).empty?
      @incident.injuries.build
    end
    if Theft.where(incident_id: @incident.id).empty?
      @incident.thefts.build  
    end
    if VehicleAccident.where(incident_id: @incident.id).empty?
      @incident.vehicle_accidents.build  
    end
    if PropertyDamage.where(incident_id: @incident.id).empty?
      @incident.property_damages.build  
    end
    if Behavioural.where(incident_id: @incident.id).empty?
      @incident.behaviourals.build  
    end
    if Misconduct.where(incident_id: @incident.id).empty?
      @incident.misconducts.build
    end
  end

  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @incident.errors.full_messages,
                                   status: :unprocessable_entry }
      end
    end
  end

  def destroy
    @incident.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to incidents_url}
      format.json { head :no_content}
    end
  end

private

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def incident_params
    params.require(:incident).permit(:date_reported,
                                     :date_of_incident,
                                     :reporter,
                                     :reporter_atc,
                                     :witness,
                                     :witness_atc,
                                     :location_id,
                                     :facility_id,
                                     :area_id,
                                     :program_id,
                                     :description,
                                     :physical_address,
                                     :severity_level_id,
                                     :emergency_notified,
                                     :insurance_filed,
                                     :emergency_detail,
                                     :insurance_detail,
                                     injuries_attributes: [:id, :incident_id, :injury_involved_type_id, :injury_involved_name,
                                      :injury_description, :injury_first_aid, :injury_guardian_notified, :injury_guardian_name, :injury_guardian_number,
                                      :_destroy],
                                     thefts_attributes: [:id, :incident_id, :theft_description, :theft_serial, :theft_security_video, :_destroy],
                                     vehicle_accidents_attributes: [:id, :incident_id, :veh_ownership_id, :veh_description, :veh_car_vin, :veh_car_plate,
                                      :veh_alternative_transport, :veh_alternative_description, :veh_alternative_car_vin, :veh_alternative_car_plate, :_destroy],
                                     property_damages_attributes: [:id, :incident_id, :prop_description, :prop_occurance, :_destroy],
                                     behaviourals_attributes: [:id, :incident_id, :behav_involved_name, :behav_involved_type_id, :behav_description, :behav_guardian_notified, 
                                      :behav_guardian_name, :behav_guardian_number, :behav_counseling, :_destroy],
                                     misconducts_attributes: [:id, :incident_id, :misconduct_description, :misconduct_cps_notified, :misconduct_cps_detail, :_destroy])
  end
end
