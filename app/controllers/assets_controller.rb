class AssetsController < ApplicationController
  def index
    @searches =  Search.order("created_at desc").pluck(:query).uniq[0..5]
    if params[:q]
      @search = Asset.search do
        fulltext params[:q]
      end
      @assets = @search.results
      if @assets.empty?
        Search.create!(query: params[:q], empty: true)
      else
        Search.create!(query: params[:q])
      end
    else
      @assets = Asset.order("created_at DESC").limit(10)
    end
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.new(params[:asset])
    if @asset.save
      flash[:notice] = "Asset was successfully saved"
      redirect_to root_url
    else
      flash[:error] = "There was a problem"
      render 'new'
    end
  end
end
