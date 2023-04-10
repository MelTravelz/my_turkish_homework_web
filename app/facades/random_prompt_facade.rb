require 'ostruct'

class RandomPromptFacade
  attr_reader :prompt_service

  def initialize 
    @prompt_service = PromptService.new
  end
  
  def get_prompt(user_id)
    search_results = prompt_service.get_new_prompt(user_id)

    OpenStruct.new(image_url_small: search_results[:attributes][:image_urls][:small], turkish_verb: search_results[:attributes][:turkish_verb], english_verb: search_results[:attributes][:english_verb])
  end
end