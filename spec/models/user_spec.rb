# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before {@user = User.new({name: 'deepak', email: 'deepak@gmail.com'})}

  subject { @user }

  it {should respond_to(:name)}
  it {should respond_to(:email)}
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
end
