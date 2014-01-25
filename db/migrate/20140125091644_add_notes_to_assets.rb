class AddNotesToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :notes, :text
  end
end
