class AssetsController < ApplicationController
  before_filter :authenticate_user!
  def index
    # @folder = current_user.folders.new
    @searches =  Search.order("created_at desc").pluck(:query).uniq[0..5]
    if params[:q]
      @search = Asset.search do
        with(:user_id, current_user.id)
        fulltext params[:q]
      end
      @assets = @search.results
      if @assets.empty?
        Search.create!(query: params[:q], empty: true)
      else
        Search.create!(query: params[:q])
      end
    else
      @assets = current_user.assets.order("created_at DESC").limit(10)
    end
  end

  def new
    @asset = current_user.assets.new
  end

  def create
    @asset = current_user.assets.create(params[:asset])
    if @asset.save
      flash[:notice] = "Asset was successfully saved"
      redirect_to root_url
    else
      flash[:error] = "There was a problem"
      render 'new'
    end
  end
end
