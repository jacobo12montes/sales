require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures email presence' do
      current_user = User.new(
        name: 'example',
        email: '',
        password: 'password',
        password_confirmation: 'password'
      ).save
      expect(current_user).to eq(false)
    end

    it 'ensures password presence' do
      current_user = User.new(
        name: 'example',
        email: 'example@email.com',
        password_confirmation: 'password'
      ).save
      expect(current_user).to eq(false)
    end

    it 'ensures name presence' do
      current_user = User.new(
        email: 'example@email.com',
        password: 'password',
        password_confirmation: 'password'
      ).save
      expect(current_user).to eq(false)
    end
  end

  context 'passwords validation' do
    it 'ensures password_confirmation presence' do
      current_user = User.new(
        name: 'example',
        email: 'example@email.com',
        password: 'password'
      ).save
      expect(current_user).to eq(false)
    end

    it 'ensures the password and password_confirmation are the same' do
      current_user = User.new(
        name: 'example',
        email: 'example@email.com',
        password: 'password',
        password_confirmation: 'passsssword'
      ).save
      expect(current_user).to eq(false)
    end

    it 'ensures the user can be created' do
      current_user = User.new(
        name: 'example',
        email: 'example@email.com',
        password: 'password',
        password_confirmation: 'password'
      ).save
      expect(current_user).to eq(true)
    end
  end
end
