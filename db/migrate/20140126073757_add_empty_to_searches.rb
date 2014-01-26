class AddEmptyToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :empty, :boolean, default: false
  end
end
