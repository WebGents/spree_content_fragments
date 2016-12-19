class MergeVideoAndImageBackgroundToMedia < ActiveRecord::Migration
  def change
    remove_attachment :spree_content_fragments, :background_video
    remove_attachment :spree_content_fragments, :background_image
    add_attachment :spree_content_fragments, :background_media
  end
end
