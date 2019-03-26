class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "adudley78"
    secret = "e5b56473bbc71d73c05657704f8ad434ba9bc0f7"

    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
      # req.options.timeout = 0
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
