require 'spec_helper'

describe User do
  before :each do
    @user = User.new
  end

  it 'should not be valid when attributes are blank' do
    @user.should_not be_valid
    @user.should have(1).error_on(:username)
    @user.should have(2).error_on(:password)
    @user.should have(1).error_on(:password_confirmation)
  end

  it 'should not be valid when username are not uniquness' do
    user = User.new(username:"a", password: "a", password_confirmation: "a")
    user.save
    user2 = User.new(username:"a", password:"a", password_confirmation: "a")
    user2.should_not be_valid
  end
end
