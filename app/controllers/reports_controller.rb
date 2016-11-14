class ReportsController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    add_breadcrumb "Reporting", :reports_path
    @search = Incident.search(params[:q])
    @reports = @search.result.paginate(:page => params[:page], :per_page => 10)
  end

  def search
    index
    render :index
  end

end
