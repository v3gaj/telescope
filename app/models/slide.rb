class Slide < ApplicationRecord

# VALIDATIONS

	validates_presence_of :title, message: :not_blank
	validates_presence_of :subtitle, message: :not_blank
	validates_presence_of :background, message: :not_blank

	has_attached_file :background, styles: { normal: '1680x1120#' }, convert_options: { normal: '-quality 50' }
	validates_attachment_size :background, in: 0..3.megabytes, message: :exceeds_size
	validates_attachment_content_type :background, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, message: :incorrect_format

# GLOBALIZE
	
	translates :title, :subtitle

end
