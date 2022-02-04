FactoryBot.define do
  factory :reservation do
    start_date {'2022-02-04'}
    end_date {'2022-02-05'}
    user_id {'1'}
    car_id {'1'}
  end
end