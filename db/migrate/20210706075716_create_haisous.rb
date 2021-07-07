class CreateHaisous < ActiveRecord::Migration[6.0]
  def change
    create_table :haisous do |t|
      t.string    :postal_code,  null: false
      t.integer   :area_id,      null: false
      t.string    :municipality, null: false
      t.string    :address,      null: false
      t.string    :building
      t.string    :phone,        null: false
      t.references    :record,       foreign_key: true
      t.timestamps
    end
  end
end