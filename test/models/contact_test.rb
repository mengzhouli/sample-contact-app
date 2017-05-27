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

  test "tag array from comma seperated string" do
    contact = contacts(:james)
    assert contact.tag_list == "competitor,family"
    assert contact.get_tags == ["competitor", "family"]
  end

  test "add new tag to tag_list" do
    contact = contacts(:james)
    new_tag = "estranged"
    contact.add_tag(new_tag)
    assert contact.tag_list == "competitor,family,estranged"
  end
end
