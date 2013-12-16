class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.string :mapping_id
      t.string :duration
      t.string :type
      t.string :total_sales_tax
      t.string :currency
      t.string :registration_fee
      t.string :temp
      t.string :maps_from_temp_ids
      t.timestamps
    end
  end
end
