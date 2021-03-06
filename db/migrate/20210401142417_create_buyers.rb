class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string      :postal_code, null: false
      t.integer     :perfecture_id, null: false
      t.string      :city, null: false
      t.string      :numbering, null: false
      t.string      :building_name
      t.string      :telephone_number, null: false
      t.references  :order, foreign_key: true
      t.timestamps
    end
  end
end
