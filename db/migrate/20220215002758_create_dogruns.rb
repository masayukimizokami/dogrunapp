class CreateDogruns < ActiveRecord::Migration[6.1]
  def change
    create_table :dogruns do |t|
      t.string :dogrun_name
      t.string :image
      t.string :address
      t.text :pr
      t.integer :user_id

      t.timestamps
    end
  end
end
