class ProjectController < ApplicationController

        get '/projects/new' do
          erb :'projects/new'
        end
      
        post '/projects' do
          project = Project.create(title: params[:title], genre: params[:genre], info: params[:info])
          redirect '/'
        end

        get '/projects' do
        end

end