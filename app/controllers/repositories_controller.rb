class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['q'] = params["query"]
      req.params['client_id'] = "Iv1.af61c9213f857512"
      req.params['client_secret'] = "05a6ac47cd923457ea202976d5bf7a9a71a6a428"
    end

    @repos = JSON.parse(resp.body)["items"]
    #name ["name"]
    #link_to_repo ["html_url"]
    #description ["description"]
    render 'search'

  end
end
