FactoryBot.define do
    factory :user do
      email                  {"ogbuda12@gmail.com"}
      name                   {"ogbuda12!"}
      password               {"ogbuda12@gmail.coM"}
      password_confirmation  {"ogbuda12@gmail.coM"}
      role                   {"basic"}
    end
  end