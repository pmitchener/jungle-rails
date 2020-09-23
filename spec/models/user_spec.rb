require 'rails_helper'
require 'user'

RSpec.describe User, type: :model do
  describe 'User Validations' do

    it 'User saves when all fields are supplied.' do
      @user = User.new(first_name: 'John1', last_name: 'Stewart1', email: 'stewart1@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(@user.errors.any?).to be(false)
    end

    it 'User must supply password' do
      @user = User.new(first_name: 'John2', last_name: 'Stewart2', email: 'stewart2@gmail.com', password: nil, password_confirmation: 'password')
      @user.save
      expect(@user.errors[:password].any?).to be(true)
    end
  
    it 'User must supply password confirmation' do
      @user = User.new(first_name: 'John3', last_name: 'Stewart3', email: 'stewart3@gmail.com', password: 'password', password_confirmation: nil)
      @user.save
      expect(@user.errors[:password_confirmation].any?).to be(true)
    end    

    it 'User email must be unique' do
      @user1 = User.new(first_name: 'John4', last_name: 'Stewart4', email: 'stewart4@gmail.com', password: 'password', password_confirmation: 'password')
      @user1.save

      @user2 = User.new(first_name: 'John5', last_name: 'Stewart5', email: 'stewart4@gmail.com', password: 'password', password_confirmation: 'password')
      @user2.save

      expect(@user2.errors[:email].any?).to be(true)
    end  

    it 'User must supply first name.' do
      @user = User.new(first_name: nil, last_name: 'Stewart6', email: 'stewart6@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(@user.errors[:first_name].any?).to be(true)
    end

    it 'User must supply last name.' do
      @user = User.new(first_name: 'John7', last_name: nil, email: 'stewart7@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(@user.errors[:last_name].any?).to be(true)
    end

  end
end
