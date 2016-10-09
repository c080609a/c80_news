require "c80_lazy_images"
# include C80LazyImages::Helpers::LazyImagesHelper

module C80News
  class ApplicationController < ActionController::Base

    helper C80LazyImages::Engine.helpers

    def guru
      respond_to do |format|
        format.js
      end
    end
  end
end
