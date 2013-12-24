



FactoryGirl.define do

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    #avatar_file_name "f20131130_161309.jpg"
    factory :attachment do
      item File.new(Rails.root + 'spec/factories/images/ruby.jpg')
    end 
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end

  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end
end