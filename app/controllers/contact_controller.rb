class ContactController < ApplicationController
	def index
		search_term = ""
		if params[:search]
			search_term = params[:search][:search]
		end

		@all_contacts = filter_contacts(current_user.contacts, search_term)
		# for creating a new contact
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

	def filter_contacts(contacts, query)
		key = "%#{query}%"
		contacts.where('first_name LIKE :query OR last_name LIKE :query OR tag_list LIKE :query', query: key).order(:last_name)
	end

	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :phone_number, :email, :address, :tag_list)
	end

end
