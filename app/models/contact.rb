class Contact < ApplicationRecord
  belongs_to :user

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
