require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :each do
    user = User.new(id: 1, username: 'hamza')
    user.email = 'foo1@foo.com'
    user.password = 'admin123'
    user.save
  end

  subject do
    Reservation.new(
      start_date: '2022-02-02',
      end_date: '2022-02-06',
      user_id: 1,
      car_id: 1
    )
  end

  before { subject.save }

  it 'is not valid with invalid name' do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with invalid end date' do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end
end
