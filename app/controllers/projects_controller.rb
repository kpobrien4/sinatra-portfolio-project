class ProjectsController < ApplicationController


        get '/projects' do
          @projects = Project.all
          erb :'projects/index'
        end

        get '/projects/new' do
          erb :'projects/new'
        end

        get '/projects/:id' do
          @project = Project.find_by_id(params[:id])
          erb :'projects/show'
        end
      
        post '/projects' do
          project = Project.create(params)
          redirect '/projects'
        end

        get '/projects/:id/edit' do
          @project = Project.find_by_id(params[:id])
          erb :'projects/edit'
        end

        patch '/projects/:id' do
          @project = Project.find_by_id(params[:id])
          @project.update(project_params)
          redirect "/projects/#{@project.id}"
        end

        private
        def project_params
          {title: params[:title], genre: params[:genre], info: params[:info]}
        end

end