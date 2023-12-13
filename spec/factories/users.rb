FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    role { Faker::Job.title }
    department { Faker::Job.field }
    experience { Faker::Number.between(from: 0, to: 10) }
    is_admin { true }
    email { Faker::Internet.email }
    image_url {}
    password { '123456' }
  end
end
