class ChartsController < ApplicationController

  def index
  end
  
  def query_pie_chart
    render :json => Search.group("query").count
  end

end
