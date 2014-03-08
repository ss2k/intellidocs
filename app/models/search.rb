class Search < ActiveRecord::Base
  attr_accessible :query, :empty
  belongs_to :user
end
