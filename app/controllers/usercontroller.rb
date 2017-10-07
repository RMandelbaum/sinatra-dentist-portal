class UserController < ApplicationController


    get '/users/signup' do


        erb :"users/signup"

      end

    post '/users/signup' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
          if @user.save
             session[:user_id] = @user.id

             redirect "/users/#{@user.slug}"
         else
            redirect '/users/signup'
         end
     end

    get '/users/login' do
        if is_logged_in?
          redirect "/users/#{@user.slug}"
        else
        erb :"users/login"
        end
    end

    post '/users/login' do
        @user = User.find_by(username: params[:username])
           if @user && @user.authenticate(params[:password])
              redirect "/users/#{@user.slug}"

           else
              redirect '/users/login'
           end

       end

    get '/users/:slug/logout' do
       if is_logged_in? && current_user.id == @user.id
         session.clear
         redirect '/'
    end

end


      get '/users/:slug' do
          @user = User.find_by(params[:user]) #says not a thing??
          @time = Time.now
          @apointment
           erb :"/users/home"
      end


end
