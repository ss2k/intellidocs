class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset
      t.text :full_data

      t.timestamps
    end
  end
end
