class Addcolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :specialties, :name, :sting
  end
end
