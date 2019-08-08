class ArtistsController < ApplicationController
    use Rack::Flash
  
  
          get '/artists' do
            redirect_if_not_signed_in
            @artists = Artist.all
            erb :'artists/index'
          end
  
          get '/artists/new' do
            redirect_if_not_signed_in
            erb :'artists/new'
          end
  
          get '/artists/:id' do
            redirect_if_not_signed_in
            set_artist
            erb :'artists/show'
          end
        
          post '/artists' do
            redirect_if_not_signed_in
            @artist = current_user.artists.build(artist_params)
            if @artist.save
            redirect '/artists'
            else
              @errors2 = @artist.errors.full_messages
              erb :'artists/new'
            end
          end
  
          get '/artists/:id/edit' do
            redirect_if_not_signed_in
            set_artist
            if @artist.user == current_user
            erb :'artists/edit'
            else 
              flash[:notice] = "You are not authorized to do that."
                redirect "/"
            end
          end
  
          patch '/artists/:id' do
            redirect_if_not_signed_in
            set_artist
           if @artist.update(artist_params)
            redirect "/artists/#{@artist.id}"
           else
            @errors2 = @artist.errors.full_messages
            erb :'artists/edit'
           end
          end
  
          delete '/artists/:id' do
            redirect_if_not_signed_in
            set_artist 
            if @artist.user == current_user
            @artist.destroy
            redirect "/artists"
            else 
              flash[:notice] = "You are not authorized to do that."
                redirect "/"
            end
          end
          
          private
          def set_artist
            @artist = Artist.find_by_id(params[:id])
          end
  
          def artist_params
            { name: params[:artist][:name], skills: params[:artist][:skills], info: params[:artist][:info], contact: params[:artist][:contact] }
          end
  
  end