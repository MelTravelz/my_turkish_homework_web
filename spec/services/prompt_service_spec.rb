require 'rails_helper'

RSpec.describe PromptService do
  describe "instance methods" do
    context "#fetch_api" do
      response = PromptService.new.fetch_api

      expect(response).to be_a(Hash)
      expect(response[:data].keys).to eq([:id, :type, :attributes])
      expect(response[:data][:attributes].keys).to eq([:image_urls, :image_id, :turkish_verb, :english_verb])
      expect(response[:data][:attributes][:image_urls].keys).to eq([:raw, :full, :regular, :small, :thumb, :small_s3])
    end
  end
end