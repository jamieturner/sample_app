class AddTotalToMappings < ActiveRecord::Migration
  def change
    add_column :mappings, :total, :string
  end
end
