module AuthenticationHelper
	def check_if_admin
	  if signed_in?
	    raise 'Only admins allowed!' unless current_user.admin?
	  else
	    # or you can use the authenticate_user! devise provides to only allow signed_in users
	    raise 'Please sign in!'
	  end
	end
end
