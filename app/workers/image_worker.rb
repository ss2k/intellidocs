class ImageWorker
  include Sidekiq::Worker
  def perform(image_url)
    
  end
end