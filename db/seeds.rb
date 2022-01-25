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

Car.create(name: 'Ferrari', brand: 'Ferrari', imgUrl: 'https://www.rikonlondon.com/wp-content/uploads/2018/11/Sx5u5V2TQ6BmGIFjPyHiw.jpg', user_id: 1)
Car.create(name: 'Yaris', brand: 'Toyota', imgUrl: 'https://www.rikonlondon.com/wp-content/uploads/2018/11/Sx5u5V2TQ6BmGIFjPyHiw.jpg', user_id: 1)
Car.create(name: 'Lancer', brand: 'Mitsubishi', imgUrl: 'https://www.rikonlondon.com/wp-content/uploads/2018/11/Sx5u5V2TQ6BmGIFjPyHiw.jpg', user_id: 1)
Car.create(name: 'CR-Z', brand: 'Honda', imgUrl: 'https://www.rikonlondon.com/wp-content/uploads/2018/11/Sx5u5V2TQ6BmGIFjPyHiw.jpg', user_id: 1)

Description.create(insurance_fee: '$200', price_daily: 5, price_monthly: 60, car_id: 1)
Description.create(insurance_fee: '$200', price_daily: 0.5, price_monthly: 0.60, car_id: 4)
Description.create(insurance_fee: '$200', price_daily: 5, price_monthly: 60, car_id: 2)
Description.create(insurance_fee: '$200', price_daily: 5, price_monthly: 60, car_id: 3)

City.create(name: 'Guatemala')
City.create(name: 'Tashkent')
City.create(name: 'Morrocco')
City.create(name: 'Palo alto')

Reservation.create(date: '22/10/2010', user_id: 1, car_id: 1, city_id: 1)
Reservation.create(date: '23/10/2010', user_id: 1, car_id: 2, city_id: 2)
Reservation.create(date: '24/10/2010', user_id: 1, car_id: 3, city_id: 3)
Reservation.create(date: '25/10/2010', user_id: 1, car_id: 4, city_id: 4)

