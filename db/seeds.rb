require 'faker'

tags = ["friend", "family", "competitor", "client", "acquaintance", "colleague"]

user = User.new(
	email: "test@test.com",
	password: "pppassword",
	password_confirmation: "pppassword"
	)
user.save!

20.times do
  contact = Contact.new(
    first_name:    Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    address: Faker::Address.street_address + ", " + Faker::Address.city + ", " + Faker::Address.country,
		tag_list: tags.sample(2).join(','),
		user: user
  )
  contact.save!
end
