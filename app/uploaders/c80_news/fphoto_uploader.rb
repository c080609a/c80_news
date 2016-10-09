module C80News
  class FphotoUploader < BaseFileUploader

    # ограничение оригинальной картинки
    process :resize_to_limit => [1600,1600]

    include CarrierWave::MiniMagick

    storage :file

    def store_dir
      "uploads/news/#{format("%02d", model.fact_id)}"
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end

    def filename
      if original_filename
        "photo_#{secure_token(4)}.#{file.extension}"
      end
    end    
    
    # ------------------------------------------------------------------------------------------------------------------------

    version :thumb_preview do
      p = C80News::Prop.first
      process :resize_to_fill => [p.thumb_preview_width, p.thumb_preview_height]
    end

    version :thumb_lg do
      process :resize_to_lg
    end

    version :thumb_md do
      process :resize_to_md
    end

    version :thumb_sm do
      process :resize_to_sm
    end

    # ------------------------------------------------------------------------------------------------------------------------

    def resize_to_lg

      manipulate! do |img|

        w = C80News::Prop.first.thumb_lg_width
        h = C80News::Prop.first.thumb_lg_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"
        img = yield(img) if block_given?
        img

      end

    end

    def resize_to_md

      manipulate! do |img|

        w = C80News::Prop.first.thumb_md_width
        h = C80News::Prop.first.thumb_md_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"
        img = yield(img) if block_given?
        img

      end

    end

    def resize_to_sm

      manipulate! do |img|

        w = C80News::Prop.first.thumb_sm_width
        h = C80News::Prop.first.thumb_sm_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"
        img = yield(img) if block_given?
        img

      end

    end

    # ------------------------------------------------------------------------------------------------------------------------

    protected
    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end
    
    private

    def calc_height_of_image(w)
      model_image = ::MiniMagick::Image.open(model.image.current_path)
      calc_height(w, model_image["width"], model_image["height"])
    end

    # подгоняем по ширине, рассчитываем высоту
    def calc_height(width, original_w, original_h)
      k = width.to_f/original_w
      original_h * k
    end


  end
end