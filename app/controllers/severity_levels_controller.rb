class SeverityLevelsController < ApplicationController

  before_filter :authenticate_user!, :check_if_admin
  before_action :set_severity_level, only: [:show, :edit, :update, :destroy]

  def check_if_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

  def index
    add_breadcrumb "Severity Levels", :severity_levels_path
  	@severity_levels = SeverityLevel.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @severity_level = SeverityLevel.new
  end

  def create
    @severity_level = SeverityLevel.create(severity_level_params)

    respond_to do |format|
      if @severity_level.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @severity_level.errors.full_messages,
                            status: :unprocessable_entry }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @severity_level.update(severity_level_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @severity_level.errors.full_messages,
                                   status: :unprocessable_entry }
      end
    end
  end

  def destroy
    @severity_level.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to severity_levels_url}
      format.json { head :no_content}
    end
  end

private

  def set_severity_level
    @severity_level = SeverityLevel.find(params[:id])
  end

  def severity_level_params
    params.require(:severity_level).permit(:name)
  end
end
