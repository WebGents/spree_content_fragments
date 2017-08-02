class AddFullPageToSpreeContentFragments < ActiveRecord::Migration
  def change
    add_column :spree_content_fragments, :fullpage, :boolean, default: true
    add_column :spree_content_fragments, :text_position, :integer, default: 1
    add_column :spree_content_fragments, :box_around_content, :boolean, default: true
  end
end
