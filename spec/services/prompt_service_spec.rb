require 'rails_helper'

RSpec.describe PromptService do
  describe "instance methods" do
    context "#fetch_api" do
      it "#get_new_prompt" do
        prompt_response = File.read("spec/fixtures/random_prompt/random_prompt.json")
        stub_request(:get, "http://localhost:3000/api/v1/users/1/pages/new")
        .to_return(status: 200, body: prompt_response, headers: {})

        # response = PromptService.new.fetch_api("users/1/pages/new")
        response = PromptService.new.get_new_prompt("1")

        expect(response).to be_a(Hash)
        expect(response.keys).to match_array([:id, :type, :attributes])
        expect(response[:attributes].keys).to match_array([:image_id, :image_urls, :turkish_verb, :english_verb])
        expect(response[:attributes][:image_urls].keys).to match_array([:raw, :full, :regular, :small, :thumb, :small_s3])
      end
    end
  end
end