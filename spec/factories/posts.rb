FactoryBot.define do
    factory :post, class: 'Post' do
      title {"String"}
      description {"text"}
      category_id { FactoryBot.create(:category).id}
      user_id { FactoryBot.create(:user).id}
      # association :category
      # association :user
    end
  end 