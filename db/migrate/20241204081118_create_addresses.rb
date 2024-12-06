class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table      :addresses do |t|
      t.string        :post_code,null: false  
      t.integer       :prefecture_id,null: false 
      t.string        :town, null: false 
      t.string        :street_address ,null: false  
      t.string        :building   
      t.string        :telephone_number,null: false 
      t.references    :order,foreign_key: true ,null:false 
   end
  end
end
