class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string        :name
      t.integer       :category_id   
      t.integer       :status_id
      t.integer       :delivery_fee_id
      t.integer       :perfecture_id
      t.integer       :delivery_days_id
      t.integer       :price
      t.text          :description
      t.references    :user, foreign_key: true
   

      t.timestamps
    end
  end
end
