require 'rails_helper'

RSpec.describe Sale, type: :model do
  current_user = User.first_or_create!(
    name: 'dean',
    email: 'dean@example.com',
    password: 'password',
    password_confirmation: 'password'
  )

  it 'has a ammount and its a number' do
    sale = Sale.create(
      user: current_user,
      title: 'some title',
      description: 'some description',
      amount: nil
    )
    expect(sale).to_not be_valid

    sale.amount = 300
    expect(sale).to be_valid
  end

  it 'has a title' do
    sale = Sale.create(
      user: current_user,
      title: '',
      description: 'some description',
      amount: 300
    )
    expect(sale).to_not be_valid

    sale.title = 'some title'
    expect(sale).to be_valid
  end

  it 'has a user' do
    sale = Sale.create(
      user: nil,
      title: 'some title',
      description: 'some description',
      amount: 300
    )
    expect(sale).to_not be_valid

    sale.user = current_user
    expect(sale).to be_valid
  end
end
