module Spree
  # Represents a fragment of content. It can belong to any kind of object
  # although at the time of writing, only products are supported (see the controller)
  class ContentFragment < Spree::Base
    acts_as_list scope: %i(parent_id parent_type)
    belongs_to :parent, polymorphic: true

    validates :title, presence: true
    validates :position, presence: true, numericality: true

    default_scope -> { order(:position) }

    ## Spree preferences


    enum content_position_h: { left: 0, center: 1, right: 2 }
    enum content_position_v: { top: 0, middle: 1, bottom: 2 }

    # Apply styling appropriate for this file
    has_attached_file :background_media,
                        styles: lambda { |a| a.instance.check_file_type}, :default_url => "missing.png",
                        default_style: :medium,
                        processors: lambda { |a| a.is_video_type? ? [ :transcoder ] : [ :thumbnail ] }

    #
    validates_attachment_content_type :background_media, :content_type => /.*/

    # Process media in background with delayed_paperclip
    process_in_background :background_media, processing_image_url: lambda { |a| a.instance.processing_image_path("missing.jpg")}

    # The path of the image that will be shown while the file is loading
    def processing_image_path(image_name)
      "/assets/" + Rails.application.assets.find_asset(image_name).digest_path
    end

    # IMPORTANT! The ffmpeg library has to added to the server machine.
    # It can be uploaded from the official website https://www.ffmpeg.org/
    def check_file_type
      if is_image_type?
        {
          thumb: '100x100>',
          medium: '640x360>',
          large: '1920x1080>'
        }
      elsif is_video_type?
        {
          thumb:          { :geometry => "100x100#", format: 'jpg', :time => 5 },
          mp4_sd:         { :geometry => "640x360#", format: 'mp4', :processors => [:transcoder] },
          mp4_hd:         { :geometry => "1920x1080#", format: 'mp4', :processors => [:transcoder] },
          #webm_sd:        { :geometry => "640x360#", format: 'webm', :processors => [:transcoder] },
          webm_hd:        { :geometry => "1920x1080#", format: 'webm', :processors => [:transcoder] }
        }
      else
        {}
      end
    end

    def view_model
      ContentFragmentViewModel.new(self)
    end

    # Method returns true if file's content type contains word 'image', overwise false
    def is_image_type?
      background_media.content_type =~ %r(image)
    end

    # Method returns true if file's content type contains word 'video', overwise false
    def is_video_type?
      background_media.content_type =~ %r(video)
    end

  end
end
