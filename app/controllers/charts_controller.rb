class ChartsController < ApplicationController

  def index
    @empty_terms = Search.where(empty: true).pluck(:query).uniq
  end
  
  def query_pie_chart
    render :json => Search.group("query").count
  end

end
