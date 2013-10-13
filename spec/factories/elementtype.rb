  FactoryGirl.define do

    factory :element_type do |f|
      f.name "test element type"
      f.before_tag "test before tag"
      f.after_tag "test after tag"

    end
  end
