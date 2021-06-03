require 'rails_helper'

RSpec.describe Groupsale, type: :model do
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

  sale = Sale.create(
    user: current_user,
    title: 'some title',
    description: 'some description',
    amount: 300
  )

  it 'has a sale_id' do
    groupsale = Groupsale.create(
      group_id: group.id,
      sale_id: nil
    )
    expect(groupsale).to_not be_valid

    groupsale.sale_id = sale.id
    expect(groupsale).to be_valid
  end

  it 'has a group_id' do
    groupsale = Groupsale.create(
      group_id: nil,
      sale_id: sale.id
    )
    expect(groupsale).to_not be_valid

    groupsale.group_id = group.id
    expect(groupsale).to be_valid
  end
end
