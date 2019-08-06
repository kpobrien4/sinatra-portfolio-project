class ProjectController < ApplicationController
    get "/projects/new" do
        erb :'/projects/new'
    end

    post "/projects" do
    end
end