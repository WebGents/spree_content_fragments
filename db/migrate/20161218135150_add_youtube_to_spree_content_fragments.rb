class AddYoutubeToSpreeContentFragments < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_content_fragments, :youtube_video_id, :string
  end
end
