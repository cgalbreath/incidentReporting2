class IncidentsController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  def index
    add_breadcrumb "Incidents", :incidents_path
    @incidents = Incident.paginate(:page => params[:page], :per_page => 10)
    TextBelt.text('8062907304', 'Hello, world!')
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
                                     incident_details_attributes: 
                                     [:id, :incident_id, :incident_type_id, :involved_name, :involved_atc, 
                                      :alternative_transport, :alternative_transport_detail, :counseling, :cps_notified, :cps_detail, 
                                      :description, :drug_screen, :emergency_notified, :emergency_detail, :first_aid, :followup, 
                                      :guardian_name, :guardian_number, :guardian_notified, 
                                      :guardian_notified_date, :involved_type_id, :insurance_filed, 
                                      :insurance_filed_detail, :members_involved, :members_involved_detail, :occurance,
                                      :staff_involved, :staff_involved_detail, :other_involved, :other_involved_detail, 
                                      :parent_pickup, :security_video, :suspended, :vehicle_ownership_id, :vehicle_description, :VIN, :_destroy])
  end
end
