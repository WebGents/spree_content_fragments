class CreateSpreeContentFragments < ActiveRecord::Migration
  def change
    create_table :spree_content_fragments do |t|
      t.references :parent, polymorphic: true, index: true, null: false
      t.string     :title, null: false
      t.string     :body
      t.string     :style
      t.string     :background_image
      t.integer    :position, null: false, default: 1000
      t.text       :preferences

      t.timestamps
    end
  end
end
