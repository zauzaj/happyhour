require 'spec_helper'

describe "adverts/edit" do
  before(:each) do
    @advert = assign(:advert, stub_model(Advert))
  end

  it "renders the edit advert form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", advert_path(@advert), "post" do
    end
  end
end
