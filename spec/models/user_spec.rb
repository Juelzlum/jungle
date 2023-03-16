require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'the user has password with nil' do
      @user = User.create(name: 'user2', email: 'user2@email.com', password: nil)
      expect(@user).not_to be_valid
    end

    it 'the email is nil' do
      @user = User.create(name: 'user2', password: 1234, password_confirmation: 1234)
      expect(@user).not_to be_valid
    end



  end 
end 