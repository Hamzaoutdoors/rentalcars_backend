# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(username: 'juanito', email: 'foo@foo.com', password: 'admin123')
User.create(username: 'Laylita', email: 'foo0@foo.com', password: 'admin123')
User.create(username: 'Nelsinito', email: 'foo1@foo.com', password: 'admin123')
User.create(username: 'Hamzita', email: 'foo2@foo.com', password: 'admin123')

Car.create(name: 'Wrangler', brand: 'Jeep', imgUrl: 'https://i.ibb.co/TPSp6yR/9.png', user_id: 4)
Car.create(name: 'X6', brand: 'BMW', imgUrl: 'https://i.ibb.co/44HhvH9/5.png', user_id: 2)
Car.create(name: 'Mustang ', brand: 'Ford', imgUrl: 'https://i.ibb.co/hgqn1y6/4.png', user_id: 1)
Car.create(name: 'IS F 4dr', brand: 'Lexus', imgUrl: 'https://i.ibb.co/Fqd9Z73/3.png', user_id: 3)
Car.create(name: 'Cherokee', brand: 'Jeep', imgUrl: 'https://i.ibb.co/0BM7Pnd/2.png', user_id: 3)
Car.create(name: 'Expedition ', brand: 'Ford', imgUrl: 'https://i.ibb.co/hdWCftm/1.png', user_id: 2)

Description.create(insurance_fee: 3, price_daily: 5, price_monthly: 150, car_id: 1, color: 'white')
Description.create(insurance_fee: 3, price_daily: 0.5, price_monthly: 15, car_id: 4, color: 'white')
Description.create(insurance_fee: 3, price_daily: 5, price_monthly: 150, car_id: 2, color: 'white')
Description.create(insurance_fee: 3, price_daily: 5, price_monthly: 150, car_id: 3, color: 'white')
Description.create(insurance_fee: 3, price_daily: 20, price_monthly: 600, car_id: 5, color: 'white')
Description.create(insurance_fee: 3, price_daily: 10, price_monthly: 300, car_id: 6, color: 'white')

City.create(name: 'Guatemala')
City.create(name: 'Tashkent')
City.create(name: 'Morrocco')
City.create(name: 'Palo alto')
City.create(name: 'Rome')
City.create(name: 'Hamburg')

Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 1, car_id: 1, city_id: 1)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 2, car_id: 2, city_id: 2)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 3, car_id: 3, city_id: 3)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 4, car_id: 4, city_id: 4)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 2, car_id: 5, city_id: 5)
Reservation.create(start_date: '2020-10-08', end_date: '2020-10-10', user_id: 3, car_id: 6, city_id: 6)

