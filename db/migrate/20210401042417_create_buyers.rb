class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string      :postal_code
      t.integer     :perfecture_id
      t.string      :city
      t.string      :numbering
      t.string      :building_name
      t.string      :telephone_number
      t.references  :order, foreign_key: true
      t.timestamps
    end
  end
end
