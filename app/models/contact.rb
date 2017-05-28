class Contact < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name,
    message: "someone else has that full name", case_sensitive: false }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }


  def get_tags
    tag_list.split(',')
  end

  def set_tags(tag_arr)
    self.update!(tag_list: tag_arr.join(','))
  end

  def add_tag(new_tag)
    tag_arr = get_tags
    tag_arr << new_tag
    set_tags(tag_arr)
  end

end
