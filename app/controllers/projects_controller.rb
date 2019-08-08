class ProjectsController < ApplicationController

        get '/projects/new' do
          erb :'projects/new'
        end
      
        post '/projects' do
          project = Project.create(params)
          redirect '/projects'
        end

        get '/projects' do
          @projects = Project.all
          erb :'projects/index'
        end

        get '/projects/:id' do
          @project = Project.find_by_id(params[:id])
          erb :'projects/show'
        end

        get 'projects/:id/edit' do
        end

end