require 'spec_helper'

describe User do
  it "invalid with minimum length user_name" do
    user = FactoryGirl.build(:user, :user_name => "aa")
    expect(user).to have(1).errors_on(:user_name)
  end

  it "invalid with maximum length user_name" do
    user = FactoryGirl.build(:user, :user_name => "a" * 21)
    expect(user).to have(1).errors_on(:user_name)
  end

  it "invalid with duplicate user name" do
    FactoryGirl.create(:user, :user_name => "user")
    user_dup = FactoryGirl.build(:user, :user_name => "user")
    expect(user_dup).to have(1).errors_on(:user_name)
  end

  it 'stores file' do
    expect_any_instance_of(ImageUploader).to receive(:store!)
    FactoryGirl.create(:user, image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'images', 'ruby.jpg')))
  end

  it "doesn't store file" do
    expect_any_instance_of(ImageUploader).not_to receive(:store!)
    FactoryGirl.create(:user, image: nil)
  end
end
