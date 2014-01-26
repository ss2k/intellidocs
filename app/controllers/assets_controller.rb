class AssetsController < ApplicationController
  def index
    if params[:q]
      @search = Asset.search do
        fulltext params[:q]
      end
      @assets = @search.results
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
