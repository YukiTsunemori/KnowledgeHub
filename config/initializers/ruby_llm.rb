RubyLLM.configure do |config|
  config.gemini_api_key = Rails.application.credentials.gemini_api_key
  config.default_embedding_model = "gemini-embedding-001"
  config.default_model = "gemini-2.5-flash-lite"
end
