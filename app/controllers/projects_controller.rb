class ProjectsController < ApplicationController
  use Rack::Flash


        get '/projects' do
          redirect_if_not_signed_in
          @projects = Project.all
          erb :'projects/index'
        end

        get '/projects/new' do
          redirect_if_not_signed_in
          erb :'projects/new'
        end

        get '/projects/:id' do
          redirect_if_not_signed_in
          set_project
          erb :'projects/show'
        end
      
        post '/projects' do
          redirect_if_not_signed_in
          @project = current_user.projects.build(project_params)
          if @project.save
          redirect '/projects'
          else
            @errors = @project.errors.full_messages
            erb :'projects/new'
          end
        end

        get '/projects/:id/edit' do
          redirect_if_not_signed_in
          set_project
          if @project.user == current_user
          erb :'projects/edit'
          else 
            flash[:notice] = "You are not authorized to do that."
              redirect "/"
          end
        end

        patch '/projects/:id' do
          redirect_if_not_signed_in
          set_project
         if @project.update(project_params)
          redirect "/projects/#{@project.id}"
         else
          @errors = @project.errors.full_messages
          erb :'projects/edit'
         end
        end

        delete '/projects/:id' do
          redirect_if_not_signed_in
          set_project 
          if @project.user == current_user
          @project.destroy
          redirect "/projects"
          else 
            flash[:notice] = "You are not authorized to do that."
              redirect "/"
          end
        end
        
        private
        def set_project
          @project = Project.find_by_id(params[:id])
        end

        def project_params
          { title: params[:project][:title], genre: params[:project][:genre], info: params[:project][:info], contact: params[:project][:contact] }
        end

end