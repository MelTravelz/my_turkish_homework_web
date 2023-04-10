require 'rails_helper'

RSpec.describe RandomPromptFacade do
  describe "instance methods" do
    context "#get_prompt" do
      it "returns an openstruct object" do
        prompt_response = File.read("spec/fixtures/random_prompt/random_prompt.json")
        stub_request(:get, "http://localhost:3000/api/v1/users/1/pages/new")
        .to_return(status: 200, body: prompt_response, headers: {})

        response = RandomPromptFacade.new

        expect(response.get_prompt("1")).to be_an(OpenStruct)

        # Are these tests necessary here since we'll be testing the values in the view/facade spec?
        expect(response.get_prompt("1").image_url_small).to eq("https://images.unsplash.com/photo-1680417264930-f62e6af52e64?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzM0NTl8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODExMDI1MjI&ixlib=rb-4.0.3&q=80&w=400")
        expect(response.get_prompt("1").turkish_verb).to eq("(i) bilmek")
        expect(response.get_prompt("1").english_verb).to eq("to know")
      end
    end
  end
end