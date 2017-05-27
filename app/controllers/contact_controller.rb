class ContactController < ApplicationController
	def index
		@all_contacts = current_user.contacts.order("last_name ASC")
		@temp_contact = Contact.new
	end

	def create
		new_contact = Contact.new(contact_params)
		new_contact.user = current_user
		new_contact.save!
		redirect_to contact_index_path
	end

	def edit
	end

	def update
		contact = Contact.find(params[:id]) 
		contact.update!(contact_params)
    redirect_to contact_index_path
	end

	def destroy
		contact = Contact.find(params[:id])
		contact.destroy!
		redirect_to contact_index_path
	end

	private

	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :phone_number, :email, :address, :tag_list)
	end
end
