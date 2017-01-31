class AddContentPositionToContentFragments < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_content_fragments, :content_position_h, :integer, default: 0
    add_column :spree_content_fragments, :content_position_v, :integer, default: 0
  end
end
