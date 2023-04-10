require 'rails_helper'

RSpec.describe "/users/:id/pages/new" do
  describe "as a visitor, when I visit the new homework form page" do
    before(:each) do
      prompt_response = File.read("spec/fixtures/random_prompt/random_prompt.json")
      stub_request(:get, "http://localhost:3000/api/v1/users/1/pages/new")
      .to_return(status: 200, body: prompt_response, headers: {})

      visit "/users/1/pages/new"
    end

    it "displays a random image, random turkish verb, & form with 10 text fields" do
      expect(page).to have_content("My Turkish Homework")
      expect(page).to have_content("(i) bilmek")
    end


  end
end