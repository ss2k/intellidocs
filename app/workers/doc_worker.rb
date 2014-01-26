class DocWorker
  include Sidekiq::Worker
  
  require 'open-uri'

  def perform(document_url, asset_id)
    doc_to_process = Yomu.new(document_url)
    doc_details = doc_to_process.text
    asset = Asset.find(asset_id)
    asset.update_attribute(:full_data, doc_details)
    puts "New document details saved"
  end
end