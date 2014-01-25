class Asset < ActiveRecord::Base
  attr_accessible :asset, :full_data

  searchable do 
    text :asset, boost: 5
    text :notes, boost: 3
    text :full_data, boost: 2
  end
end
