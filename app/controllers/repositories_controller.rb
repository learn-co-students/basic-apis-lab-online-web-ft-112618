class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = '1191550d27925436ae96'
      req.params['client_secret'] = '66dce7a4a258da696e59743bd0cbaed5e052bfdd'
      req.params['q'] = params[:query]
  end
  body = JSON.parse(@resp.body)
  @repos = body["items"]
  render 'search'
end
end
