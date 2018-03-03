module CarrierWave
  module RMagick
    attr_reader :dimension

    def set_dimension
      image = Magick::Image.read(current_path).shift
      @dimension = { width: image.columns, height: image.rows }
    end
  end
end
