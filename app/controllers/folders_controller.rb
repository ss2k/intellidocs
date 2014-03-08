class FoldersController < ApplicationController

  def create
    current_user.folders.create!(params[:folder])
    respond_to do |format|
      format.js
    end
  end
end
