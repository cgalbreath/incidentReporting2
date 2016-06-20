class IncidentsController < ApplicationController
  def index
    @incidents = Incident.all
  end

  def show
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
  end

  def create
    @incident = Incident.new(incident_params)
    if @incident.save
      redirect_to @incident, notice: "Successfully added an incident"
    else
      render 'new'
    end
  end

private
  def incident_params
    params.require(:incident).permit(:reporter, :witness, :location, :address, :description)
  end
end
