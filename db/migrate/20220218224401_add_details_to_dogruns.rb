class AddDetailsToDogruns < ActiveRecord::Migration[6.1]
  def change
    add_column :dogruns, :area, :text
  end
end
