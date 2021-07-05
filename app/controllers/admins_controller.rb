class AdminsController < ApplicationController

    def index
		authorize! :destroy, User, message: "You are not authorized"

		@users = User.all
	end


	def ban_user
		authorize! :destroy, User, message: "You are not authorized"

		u = User.find(params[:id])
		u.unset_reguser
		redirect_to :admin_view, notice: "The user has been banned succesfully"
	end


	def unban_user
		authorize! :destroy, User, message: "You are not authorized"

		u = User.find(params[:id])
		u.set_reguser
		redirect_to :admin_view, notice: "The user has been unbanned succesfully"
	end

	def admin_user
		authorize! :destroy, User, message: "You are not authorized"

		u = User.find(params[:id])
		u.set_reguser
		u.set_admin
		redirect_to :admin_view, notice: "The user has been assigned to the admin role succesfully"
	end


	def unadmin_user
		authorize! :destroy, User, message: "You are not authorized"

		u = User.find(params[:id])
		u.unset_admin
		redirect_to :admin_view, notice: "The user has been removed from the admin role succesfully"
	end

	def destroy_user
		authorize! :destroy, User, message: "You are not authorized"

		u = User.find(params[:id])
		u.destroy
		redirect_to :admin_view, notice: "The user has been deleted successfully"
	end

end
