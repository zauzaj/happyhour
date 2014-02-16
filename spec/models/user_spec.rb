require 'spec_helper'

describe User do

  it "has valid factory" do
    expect(build(:user)).to be_valid
  end

  it "invalid with minimum length user_name" do
    user = build(:user, :user_name => "aa")
    expect(user).to have(1).errors_on(:user_name)

  end
  it "invalid with maximum length user_name" do
    user = build(:user, :user_name => "a" * 8)
    expect(user).to have(1).errors_on(:user_name)
  end

  it "invalid without mobile_number_1" do
    user = build(:user, :mobile_number_1 => nil)
    expect(user).to have(1).errors_on(:mobile_number_1)
  end

  it "invalid with duplicate user name" do
    create(:user, :user_name => "user")
    user_dup = build(:user, :user_name => "user")
    expect(user_dup).to have(1).errors_on(:user_name)
  end



end
