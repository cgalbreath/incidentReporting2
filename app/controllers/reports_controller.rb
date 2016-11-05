class ReportsController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    add_breadcrumb "Reporting", :reports_path
  end
end
