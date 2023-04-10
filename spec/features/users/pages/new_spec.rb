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
      expect(page).to have_content("Turkish Verb:")
      expect(page).to have_content("(i) bilmek")
      expect(page).to have_content("Theme Image:")
      expect(page).to have_css("img[src^='https://images.unsplash.com/photo-1680792563719-288027b2a090?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzM0NTl8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODExMDYzNDA&ixlib=rb-4.0.3&q=80&w=400']")
      save_and_open_page
    end
  end
end