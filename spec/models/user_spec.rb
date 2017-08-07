require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    before do
      @testuser = User.new(
        first_name: "TEST",
        last_name: "TEST",
        email: "user@test.com",
        password: "test",
        password_confirmation: "test"
      )
      @testuser.save
  end

    it "Should not save if there is no password and password confirmation." do
      @user = User.new(
        first_name: 'TEST',
        last_name: "TEST",
        email: "test@test.com",
      )
      expect(@user.valid?).to be(false)
    end

    it "Should not save if password and password confirmation do not match" do
      @user = User.new(
        first_name: "TEST",
        last_name: "TEST",
        email: "test@test.com",
        password: "garo",
        password_confirmation: "Assilian"
      )
      expect(@user.valid?).to be(false)
    end

    it "Should should save if password and password confirmation are the same" do
      @user = User.new(
      first_name: "TEST",
      last_name: "TEST",
      email: "test@test.com",
      password: "garo",
      password_confirmation: "garo"
      )
      expect(@user.valid?).to be(true)
    end

    it "Shoult not save if first name is not specified" do
      @user = User.new(
        last_name: "TEST",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      )
      expect(@user.valid?).to be(false)
    end

    it "Should not save if last name is not specified" do
      @user = User.new(
        first_name: "TEST",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      )
      expect(@user.valid?).to be(false)
    end

    it "Should not save if email is not specified" do
      @user = User.new(
        first_name: "TEST",
        last_name: "TEST",
        password: "test",
        password_confirmation: "test"
      )
      expect(@user.valid?).to be(false)
    end

    it "Should save if all fields are present" do
      expect(@testuser.valid?).to be(true)
    end

    it "Should not save if email is not unique" do
      @user = User.new(
        first_name: "TEST",
        last_name: "TEST",
        email: "user@test.com",
        password: 'test',
        password_confirmation: 'test'
      )
      expect(@user.valid?).to be(false)
    end

    it "Should not save if inputted email exists but is in different case" do
      @user = User.new(
        first_name: "TEST",
        last_name: 'TEST',
        email: "USER@TEST.com",
        password: "test",
        password_confirmation: "test"
      )
      expect(@user.valid?).to be(false)
    end

    it "Should not save if password has less than three characters" do
      @user = User.new(
        first_name: "TEST",
        last_name: "TEST",
        email: "test@test.com",
        password: "2",
        password_confirmation: "2"
      )
      expect(@user.valid?).to be(false)
    end

  end
end



# validates :first_name, presence: true
# validates :last_name, presence: true
# validates :email, presence: true, uniqueness: true
