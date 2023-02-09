class Removecolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :specialty
  end
end

