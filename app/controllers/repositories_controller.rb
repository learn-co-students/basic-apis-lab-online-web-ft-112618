require 'pry'
class RepositoriesController < ApplicationController
ROOT = 'https://api.github.com'


  def search

  end

  def github_search
      client_id = "REPLACE ME"
      secret = "REPLACE ME"

      resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params["q"] = params[:query]
        req.params["client_id"] = client_id
        req.params["client_secret"] = secret
      end

      body = JSON.parse(resp.body)
      binding.pry
      @results = body["items"]
      render :search
    end
end
