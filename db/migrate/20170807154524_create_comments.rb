class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :user
      t.string :references
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
