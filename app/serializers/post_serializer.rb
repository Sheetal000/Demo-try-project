class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :dislike_counts,:search
  belongs_to :user
  belongs_to :category

  def dislike_counts
    object.likes.where(active: false).count
  end
end
