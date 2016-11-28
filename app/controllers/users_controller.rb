class UsersController < ApplicationController

  before_filter :authenticate_user!, :check_if_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_if_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

  def index
    add_breadcrumb "Users", :users_path
  	@users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.invite!(user_params)

    respond_to do |format|
      if @user.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @user.errors.full_messages,
                            status: :unprocessable_entry }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @user.errors.full_messages,
                                   status: :unprocessable_entry }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to users_url}
      format.json { head :no_content}
    end
  end

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :phone])
end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,
                                 :admin,
                                 {:facility_id => []},
                                 {:program_id => []}
                                 )
  end
end
