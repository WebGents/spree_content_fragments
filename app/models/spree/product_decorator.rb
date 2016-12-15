module Spree
  # Add an association to Products so its content fragments can be easily loaded
  Product.class_eval do
    has_many :content_fragments, as: :parent
  end


end
