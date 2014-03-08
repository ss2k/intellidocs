class Asset < ActiveRecord::Base
  attr_accessible :asset, :full_data, :notes

  belongs_to :user

  mount_uploader :asset, AssetUploader

 after_commit :save_file_details

  searchable do 
    text :asset, boost: 5
    text :notes, boost: 3
    text :full_data, boost: 2
    integer (:user_id)
  end

  EXTRACT_FILE_EXTENSIONS = ['pdf', 'docx', 'doc']
  IMAGE_FILE_EXTENSIONS = ['jpg', 'gif', 'png']

  private

  def save_file_details
    if asset.present? || asset_changed?
      if EXTRACT_FILE_EXTENSIONS.include?(asset.file.filename.split(".").last)
        DocWorker.perform_async(asset.url, self.id)
      elsif IMAGE_FILE_EXTENSIONS.include?(asset.file.filename.split(".").last)
        parse_img(asset)
      else
        self.full_data = "No recognizable file extension  - #{asset.file.filename}"
        self.save
      end
    end
  end

  # def parse_doc(doc)
  #   # data = File.read(doc)
  #   # text = Yomu.read :text, data
  #   self.full_data = "Asset is a doc"
  #   self.save
  # end

  def parse_img(img)
    self.full_data = "This is an image"
    self.save
  end
end
