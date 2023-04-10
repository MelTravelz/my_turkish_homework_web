require 'rails_helper'

RSpec.describe PromptService do
  describe "instance methods" do
    context "#fetch_api" do
      it "#get_prompt" do
        # response = PromptService.new.fetch_api("users/1/pages/new")
        response = PromptService.new.get_prompt("1")

        expect(response).to be_a(Hash)
        expect(response[:data].keys).to match_array([:id, :type, :attributes])
        expect(response[:data][:attributes].keys).to match_array([:image_id, :image_urls, :turkish_verb, :english_verb])
        expect(response[:data][:attributes][:image_urls].keys).to match_array([:raw, :full, :regular, :small, :thumb, :small_s3])
      end
    end
  end
end