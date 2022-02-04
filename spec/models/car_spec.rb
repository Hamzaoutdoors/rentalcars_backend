require 'rails_helper'

RSpec.describe Car, type: :model do
  before :each do
    user = User.new(id: 1, username: 'hamza')
    user.email = 'foo1@foo.com'
    user.password = 'admin123'
    user.save
  end

  subject do
    Car.new(
      name: 'Anything',
      brand: 'Brand',
      imgUrl: '10dfsg',
      user_id: 1
    )
  end

  before { subject.save }

  it 'is valid with valid name' do
    expect(subject).to be_valid
  end

  it 'is not valid with invalid name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid brand' do
    expect(subject).to be_valid
  end

  it 'is not valid with invalid brand' do
    subject.brand = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid imgUrl' do
    expect(subject).to be_valid
  end
end
