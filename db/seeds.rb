# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'juanito', email: 'foo@foo.com')
User.create(username: 'Laylita', email: 'foo0@foo.com')
User.create(username: 'Nelsinito', email: 'foo1@foo.com')
User.create(username: 'Hamzita', email: 'foo2@foo.com')

Car.create(name: 'Renegade', brand: 'Jeep', imgUrl: 'https://i.ibb.co/M6DqDcJ/2.png', user_id: 4)
Car.create(name: 'Yaris', brand: 'Toyota', imgUrl: 'https://i.ibb.co/Hpq2DCn/4.png', user_id: 2)
Car.create(name: 'Lancer', brand: 'Mitsubishi', imgUrl: 'https://i.ibb.co/bvyvCC0/1.png', user_id: 1)
Car.create(name: 'CR-Z', brand: 'Honda', imgUrl: 'https://i.ibb.co/bvyvCC0/1.png', user_id: 3)
Car.create(name: 'Clio', brand: 'Renault', imgUrl: 'https://i.ibb.co/bvyvCC0/4.png', user_id: 3)
Car.create(name: 'Civic', brand: 'Honda', imgUrl: 'https://i.ibb.co/bvyvCC0/2.png', user_id: 2)

Description.create(insurance_fee: '$200', price_daily: 5, price_monthly: 60, car_id: 1)
Description.create(insurance_fee: '$200', price_daily: 0.5, price_monthly: 0.60, car_id: 4)
Description.create(insurance_fee: '$200', price_daily: 5, price_monthly: 60, car_id: 2)
Description.create(insurance_fee: '$200', price_daily: 5, price_monthly: 60, car_id: 3)
Description.create(insurance_fee: '$400', price_daily: 20, price_monthly: 90, car_id: 5)
Description.create(insurance_fee: '$500', price_daily: 10, price_monthly: 100, car_id: 6)

City.create(name: 'Guatemala')
City.create(name: 'Tashkent')
City.create(name: 'Morrocco')
City.create(name: 'Palo alto')
City.create(name: 'Rome')
City.create(name: 'Hamburg')

Reservation.create(date: '22/10/2010', user_id: 1, car_id: 1, city_id: 1)
Reservation.create(date: '23/10/2010', user_id: 2, car_id: 2, city_id: 2)
Reservation.create(date: '24/10/2010', user_id: 3, car_id: 3, city_id: 3)
Reservation.create(date: '25/10/2010', user_id: 4, car_id: 4, city_id: 4)
Reservation.create(date: '26/10/2010', user_id: 2, car_id: 5, city_id: 5)
Reservation.create(date: '27/10/2010', user_id: 3, car_id: 6, city_id: 6)

