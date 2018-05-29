class Service < ApplicationRecord

    # VALIDATIONS

    validates_presence_of :title, message: :not_blank
    validates_presence_of :subtitle, message: :not_blank
    validates_presence_of :description, message: :not_blank
    validates_presence_of :image, message: :not_blank

    has_attached_file :image, styles: { normal: '2250x1500#' }, convert_options: { normal: '-quality 50' }
    validates_attachment_size :image, in: 0..3.megabytes, message: :exceeds_size
    validates_attachment_content_type :image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, message: :incorrect_format

    # GLOBALIZE

    translates :title, :subtitle, :description

end