require 'rails_helper'

RSpec.describe Group, type: :model do
  include Rack::Test::Methods
  include ActionDispatch::TestProcess::FixtureFile

  current_user = User.first_or_create!(
    name: 'dean',
    email: 'dean@example.com',
    password: 'password',
    password_confirmation: 'password'
  )

  it 'has a name' do
    group = Group.create(
      name: '',
      user: current_user,
      icon: fixture_file_upload('spec/fixtures/profile-pic.png', 'image/png')
    )
    expect(group).to_not be_valid

    group.name = 'newGroup'
    expect(group).to be_valid
  end

  it 'has a user' do
    group = Group.create(
      name: 'newGroup',
      user: nil,
      icon: fixture_file_upload('spec/fixtures/profile-pic.png', 'image/png')
    )
    expect(group).to_not be_valid

    group.user = current_user
    expect(group).to be_valid
  end
end
