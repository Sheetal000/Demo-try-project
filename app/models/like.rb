class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post


    after_create :update_like_counts

    default_scope { where(active: true) }
    scope :actives, -> { where(active: true) }

    def update_like_counts
        current_count = self.post.likes.where(active: true).size
        # total_count = self.active ? current_count + 1 : current_count - 1
        self.post.update(like_count: current_count)
    end

end
