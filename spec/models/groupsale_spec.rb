require 'rails_helper'
RSpec.describe Groupsale, type: :model do
  include Rack::Test::Methods
  include ActionDispatch::TestProcess::FixtureFile

  # icon = fixture_file_upload('spec/fixtures/profile-pic.png', 'image/png')
  # icon = fixture_file_upload(Rails.root.join('spec/fixtures', 'profile-pic.png'), 'image/gif')
  # it 'it true' do
  #   icon = fixture_file_upload(Rails.root.join('spec/fixtures', 'profile-pic.png'), 'image/gif')
  # end

  current_user = User.first_or_create!(
    name: 'dean',
    email: 'dean@example.com',
    password: 'password',
    password_confirmation: 'password'
  )

  sale = Sale.create(
    user: current_user,
    title: 'some title',
    description: 'some description',
    amount: 300
  )

  it 'has a sale_id' do
    group = Group.create(
      name: 'newGroup',
      user: current_user,
      icon: fixture_file_upload('spec/fixtures/profile-pic.png', 'image/png')
    )
    groupsale = Groupsale.create(
      group_id: group.id,
      sale_id: nil
    )
    expect(groupsale).to_not be_valid

    groupsale.sale_id = sale.id
    expect(groupsale).to be_valid
  end

  it 'has a group_id' do
    group = Group.create(
      name: 'newGroup',
      user: current_user,
      icon: fixture_file_upload('spec/fixtures/profile-pic.png', 'image/png')
    )
    groupsale = Groupsale.create(
      group_id: nil,
      sale_id: sale.id
    )
    expect(groupsale).to_not be_valid

    groupsale.group_id = group.id
    expect(groupsale).to be_valid
  end
end
