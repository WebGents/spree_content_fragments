module Spree
  module Admin
    class ContentFragmentsController < ResourceController
      belongs_to 'spree/product', find_by: :slug

      def index
        @content_fragments = @product.content_fragments
      end
    end
  end
end
