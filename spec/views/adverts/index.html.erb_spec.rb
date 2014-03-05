require 'spec_helper'

describe "adverts/index" do
  before(:each) do
    assign(:adverts, [
      stub_model(Advert),
      stub_model(Advert)
    ])
  end

  it "renders a list of adverts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
