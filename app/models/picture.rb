class Picture < ApplicationRecord
  has_one_attached :data do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :feed_sm, resize_to_limit: [450, 450], saver: { quality: 100 }
    attachable.variant :feed_lg, resize_to_limit: [1200, 450], saver: { quality: 100 }
  end

  scope :sorted, -> { order(:sort_index) }

  enum picture_type: {
    photobox: 0,
    photographer: 1,
    user_upload: 2
  }
end
