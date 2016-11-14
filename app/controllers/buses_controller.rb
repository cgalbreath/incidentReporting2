class BusesController < ApplicationController

  before_filter :authenticate_user!, :check_if_admin
  before_action :set_bus, only: [:show, :edit, :update, :destroy]

  def check_if_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

  def index
    add_breadcrumb "Buses", :buses_path
  	@buses = Bus.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.create(bus_params)

    respond_to do |format|
      if @bus.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @bus.errors.full_messages,
                            status: :unprocessable_entry }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @bus.errors.full_messages,
                                   status: :unprocessable_entry }
      end
    end
  end

  def destroy
    @bus.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to buses_url}
      format.json { head :no_content}
    end
  end

private

  def set_bus
    @bus = Bus.find(params[:id])
  end

  def bus_params
    params.require(:bus).permit(:BUS_NUM,
                                :FOUR_VIN,
                                :PLATE,
                                {:assigned_facilities => []},
                                {:assigned_programs => []})
  end
end
