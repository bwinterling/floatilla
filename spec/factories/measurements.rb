# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :measurement do
    gauge nil
    datetime ""
    unit "MyString"
    value "MyString"
  end
end
