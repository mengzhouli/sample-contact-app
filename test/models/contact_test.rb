require 'test_helper'

class ContactTest < ActiveSupport::TestCase
   test "contact name" do
     contact = contacts(:james)
     assert contact.first_name == 'James'
   end

   test "contact belongs to user" do
   	contact = contacts(:james)
   	assert contact.user.email =="john@doe.com"
   end
end
