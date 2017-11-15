class AddContentPositionToContentFragment < ActiveRecord::Migration[5.0]
  def change
    remove_column :spree_content_fragments, :content_position_h
    remove_column :spree_content_fragments, :content_position_v
    add_column :spree_content_fragments, :content_position, :integer, default: 5
  end
end
