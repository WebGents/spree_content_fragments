class AddBackgroundImageToContentFragments < ActiveRecord::Migration
  def change
    remove_column :spree_content_fragments, :background_image
    add_attachment :spree_content_fragments, :background_image
  end
end
