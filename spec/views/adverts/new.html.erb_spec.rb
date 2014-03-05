require 'spec_helper'

describe "adverts/new" do
  before(:each) do
    assign(:advert, stub_model(Advert).as_new_record)
  end

  it "renders new advert form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", adverts_path, "post" do
    end
  end
end
