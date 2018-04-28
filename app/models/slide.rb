class Slide < ApplicationRecord


# VALIDATIONS

	has_attached_file :background, styles: { normal: '' }, convert_options: { normal: '-quality 50' }
	validates_attachment :background, presence: true, size: { in: 0..3.megabytes }
	validates_attachment_content_type :background, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

end
