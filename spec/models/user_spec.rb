require 'spec_helper'

describe User do
  before do
    @user = User.new(name:"Sample User", email: "user@sample.com",
                     password: "pwdpwd", password_confirmation:"pwdpwd") 
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it {should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @user.email = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email foramt is invalid" do
    it "should be invalid" do
      adresses = ["ben@ams,com", "user_name_mail", "www.one.co.il", "<p>+.gmail"]
      adresses.each do |address|
        @user.email = address
        @user.should_not be_valid
      end
    end
  end
 
  describe "when email foramt is valid" do
    it "should be valid" do
      adresses = ["ben@ams.com", "user_name@mail.org.il", "www@one.co.il", "p.g@gmail.com"]
      adresses.each do |address|
        @user.email = address.upcase
        @user.should be_valid
      end
    end
  end
  
  describe "when email address is already taken" do
    before do 
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil } 
    it { should_not be_valid }
  end

  describe "return value of authentication method" do 
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
  
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
end
