class PromptService
  def fetch_api(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_prompt(id)
    fetch_api("users/#{id}/pages/new")
  end
  
  private
  def connection
    Faraday.new(url: "http://localhost:3000/api/v1/") do |faraday|
      # faraday.params["client_id"] =  ENV["unsplash_api_key"]
      # faraday.params["count"] =  1
    end
  end
end