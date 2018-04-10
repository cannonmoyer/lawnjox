config = {
  host: "https://f9a2zbqaa3:1mv4dj0kmg@ash-9594552.us-east-1.bonsaisearch.net",
  transport_options: {
    request: { timeout: 5 }
  }
}

if File.exists?("config/elasticsearch.yml")
  config.merge!(YAML.load_file("config/elasticsearch.yml")[Rails.env].symbolize_keys)
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)