class ProjectsController < ApplicationController


        get '/projects' do
          @projects = Project.all
          erb :'projects/index'
        end

        get '/projects/new' do
          erb :'projects/new'
        end

        get '/projects/:id' do
          set_project
          erb :'projects/show'
        end
      
        post '/projects' do
          @project = Project.new(project_params)
          if @project.save
          redirect '/projects'
          else
            @errors = @project.errors.full_messages
            erb :'projects/new'
          end
        end

        get '/projects/:id/edit' do
          set_project
          erb :'projects/edit'
        end

        patch '/projects/:id' do
          set_project
         if @project.update(project_params)
          redirect "/projects/#{@project.id}"
         else
          @errors = @project.errors.full_messages
          erb :'projects/edit'
         end
        end

        delete '/projects/:id' do
          set_project
          @project.destroy
          redirect "/projects"
        end
        
        private
        def set_project
          @project = Project.find_by_id(params[:id])
        end

        def project_params
          { title: params[:project][:title], genre: params[:project][:genre], info: params[:project][:info] }
        end

end