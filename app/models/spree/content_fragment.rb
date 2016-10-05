module Spree
  # Represents a fragment of content. It can belong to any kind of object
  # although at the time of writing, only products are supported (see the controller)
  class ContentFragment < ActiveRecord::Base
    acts_as_list scope: %i(parent_id parent_type)
    belongs_to :parent, polymorphic: true

    validates :title, presence: true
    validates :position, presence: true, numericality: true
  end
end
