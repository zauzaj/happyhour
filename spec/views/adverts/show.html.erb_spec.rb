require 'spec_helper'

describe "adverts/show" do
  before(:each) do
    @advert = assign(:advert, stub_model(Advert))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
