class Category < ApplicationRecord
    has_many :posts,class_name: "Post"
end
