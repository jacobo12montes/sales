require 'rails_helper'

RSpec.describe Sale, type: :model do
  current_user = User.first_or_create!(
    name: 'dean',
    email: 'dean@example.com',
    password: 'password',
    password_confirmation: 'password'
  )

  group = Group.create(
    name: 'newGroup',
    user: current_user
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
    expect(group).to be_valid
  end

  it 'can have a group' do
    sale = Sale.create(
      user: current_user,
      title: 'some title',
      description: 'some description',
      amount: 300,
      group_id: group.id
    )
    expect(sale).to be_valid
  end
end
