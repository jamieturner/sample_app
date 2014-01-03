include ActionDispatch::TestProcess



FactoryGirl.define do

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "bob_#{n}@mail.com"}
    #avatar_file_name "f20131130_161309.jpg"
avatar { fixture_file_upload(Rails.root.join('spec/factories/images/ruby.jpg'), 'image/jpg') }

    #factory :attachment do
     # item File.new(Rails.root + 'spec/factories/images/ruby.jpg')
    #end 
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