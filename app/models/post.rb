class Post < ApplicationRecord
    # paginates_per 25
    belongs_to :user
    belongs_to :category,class_name: "Category"
    has_many :likes
    has_one_attached :insta_image

    validates :title,presence: true

    # CATEGORY = ["Event", "Job", "Report"].freeze
end
