class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.text :notes
      t.integer :user_id
    end
  end
end
