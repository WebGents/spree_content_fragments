class AddAttachmentBackgroundVideoToSpreeContentFragments < ActiveRecord::Migration
  def self.up
    change_table :spree_content_fragments do |t|
      t.attachment :background_video
    end
  end

  def self.down
    remove_attachment :spree_content_fragments, :background_video
  end
end
