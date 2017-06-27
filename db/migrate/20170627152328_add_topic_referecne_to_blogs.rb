class AddTopicReferecneToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :blogs, :topic, foreign_key: true
  end
end
