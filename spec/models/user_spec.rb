# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'spec_helper'

describe User do
  before {@user = User.new({name: 'deepak', email: 'deepak@gmail.com', password: 'Abc123', password_confirmation: 'Abc123'})}

  subject { @user }

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:authenticate)}
  it {should be_valid}

  describe "when name not present" do
  	before {@user.name =""}

  	it {should_not be_valid}
  end

  describe "when name is too long" do
  	before {@user.name = "a" * 41}

  	it {should_not be_valid}
  end

  describe "when email not present" do
  	before {@user.email = ""}

  	it {should_not be_valid}
  end

  describe "when email is not valid" do
    before {@user.email = "deepak.com"}

    it {should_not be_valid}
  end

  describe "when email is valid" do
    before {@user.email = "deepakchampatiray@gmail.com"}

    it{should be_valid}
  end

  describe "when email is not unique" do
    before do
      duplicate_user = @user.dup;
      @user.email = @user.email.upcase;
      duplicate_user.save;
    end
    
    it{should_not be_valid}
  end

  describe "verify email downcase" do
    let(:mixed_case_email) { 'userEmailInMiXedType@mail.COM' }
    before do 
      @user.email = mixed_case_email
      @user.save;
    end

    it "should save email in lower case" do 
      @user.reload.email.should == mixed_case_email.downcase;
    end
  end

  describe "when password is blank" do
    before do
      @user.password = @user.password_confirmation = "";
    end

    it {should_not be_valid}
  end

  describe "when password and confirmation do not match" do
    before { @user.password_confirmation = "mismatch" }

    it {should_not be_valid}
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }

    it {should_not be_valid}
  end

  describe "password that is too short" do
    before { @user.password_confirmation = @user.password = 'a'*5}

    it {should_not be_valid}
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do 
      it {should == found_user.authenticate(@user.password)}
    end

    describe "with invalid passowrd" do
      let(:user_with_inalid_password) {found_user.authenticate("invalid")}

      it { should_not == user_with_inalid_password }
    end
  end

end
