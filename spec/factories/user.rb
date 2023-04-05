FactoryBot.define do
    factory :user, class: 'User' do
      email {Faker::Internet.email}
      password {Faker::Internet.password}
      name {"String"}
    end
  end 