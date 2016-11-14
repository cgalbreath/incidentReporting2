class ProgramsController < ApplicationController

  before_filter :authenticate_user!, :check_if_admin
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def check_if_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

  def index
    add_breadcrumb "Program", :programs_path
  	@programs = Program.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.create(program_params)

    respond_to do |format|
      if @program.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @program.errors.full_messages,
                            status: :unprocessable_entry }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @program.update(program_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @program.errors.full_messages,
                                   status: :unprocessable_entry }
      end
    end
  end

  def destroy
    @program.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to programs_url}
      format.json { head :no_content}
    end
  end

private

  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name)
  end
end
