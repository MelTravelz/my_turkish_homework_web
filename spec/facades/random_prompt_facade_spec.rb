require 'rails_helper'

RSpec.describe RandomPromptFacade do
  describe "instance methods" do
    context "#get_prompt" do
      it "returns a hash ?" do
        prompt_facade = RandomPromptFacade.new

        expect(prompt_facade.get_prompt("1")).to be_an(OpenStruct)

        # These will change every time but are working for now
        # Need to use webmock
        # expect(prompt_facade.image_url_small).to eq("https://images.unsplash.com/photo-1678884212100-d6bc7a5b831c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MzM0NTl8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODExMDM3MTc&ixlib=rb-4.0.3&q=80&w=400")
        # expect(prompt_facade.image_url_small).to eq("(i) istemek")
        # expect(prompt_facade.image_url_small).to eq("to want")
      end
    end
  end
end