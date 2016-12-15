module Spree
  # Represents a fragment of content. It can belong to any kind of object
  # although at the time of writing, only products are supported (see the controller)
  class ContentFragment < Spree::Base
    acts_as_list scope: %i(parent_id parent_type)
    belongs_to :parent, polymorphic: true

    validates :title, presence: true
    validates :position, presence: true, numericality: true

    has_attached_file :background_image,
                      styles: { mini: '48x48>', small: '100x100>' },
                      default_style: :small,
                      url: '/spree/:class/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/:class/:id/:style/:basename.:extension'

    validates_attachment :background_image, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }

    default_scope -> { order(:position) }

    preference :fullscreen, :boolean_select, default: :true

    def view_model
      ContentFragmentViewModel.new(self)
    end
  end
end
