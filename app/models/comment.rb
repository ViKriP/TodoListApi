class Comment < ApplicationRecord
  SIZE = {
    text: (10..256),
    attachment: 1
  }.freeze

  belongs_to :task

  validates :text,
            presence: true,
            length: { in: SIZE[:text] }

  mount_uploader :attachment, AttachmentUploader
end
