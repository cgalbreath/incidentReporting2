class UsersController < ApplicationController

  before_filter :authenticate_user!, :check_if_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def check_if_admin
    if signed_in?
      raise 'Only admins allowed!' unless current_user.admin?
    else
      # or you can use the authenticate_user! devise provides to only allow signed_in users
      raise 'Please sign in!'
    end
  end

  def index
    add_breadcrumb "Users", :users_path
  	@users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

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
      if @user.update(user_params)
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

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,
                                 :email,
                                 :admin,
                                 :password,
                                 {:facility_id => []},
                                 {:program_id => []},
                                 :first_name,
                                 :last_name,
                                 :phone)
  end
end
