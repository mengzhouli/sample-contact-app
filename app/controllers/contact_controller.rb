class ContactController < ApplicationController
	def index
		@all_contacts = current_user.contacts
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
		contact = Contact.find(params[:id]) 
		contact.update!(contact_params)
    redirect_to contact_index_path
	end

	def destroy
	end

	private

	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :phone_number, :email, :address, :tag_list)
	end
end
