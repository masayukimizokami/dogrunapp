class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :contents
      t.integer :dogrun_id
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
