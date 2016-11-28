class Users::InvitationsController < Devise::InvitationsController
  # POST /resource/invitation
  def create
    if params["password"].present?
      self.resource = invite_resource_and_skip
      self.resource.assign_attributes(:password => params["password"], :password_confirmation => params["password"])
      self.resource.accept_invitation!
    else
      self.resource = invite_resource
    end

    if resource.errors.empty?
      yield resource if block_given?

      if params["password"].present?
        set_flash_message :notice, :user_added, :email => self.resource.email
      else
        set_flash_message :notice, :send_instructions, :email => self.resource.email
      end

      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end

  protected

  def invite_resource_and_skip
    resource_class.invite!(invite_params, current_inviter) do |u|
      ## skip sending emails on invite
      u.skip_invitation = true
    end
  end

  private

  def update_resource_params
    params.require(:user).permit(:password, :password_confirmation, :username, :first_name, :last_name, :phone, :invitation_token)
  end
end