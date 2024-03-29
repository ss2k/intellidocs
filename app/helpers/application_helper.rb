module ApplicationHelper

  def get_extension(filename)
    filename.split(".").last
  end

  def get_class(ext)

    ms_word = ["doc", "docx", "txt"]
    powerpoint = ["ppt", "pptx"]
    images = ["jpg", "gif", "png", "bmp"]

    case ext
    when *powerpoint
      return "ppt"
    when *ms_word
      return "doc"
    when "pdf"
      return "pdf"
    when *images
      return "images"
    else
      return "folder"
    end

  end

  def get_kind(ext)
    ms_word = ["doc", "docx"]
    powerpoint = ["ppt", "pptx"]
    images = ["jpg", "gif", "png", "bmp"]

    case ext
    when *powerpoint
      return "Powerpoint"
    when *ms_word
      return "Microsoft Word"
    when "pdf"
      return "Adobe PDF"
    when *images
      return "Image"
    when "txt"
      return "Plain text"
    else
      return "Other"
    end
  end

end
