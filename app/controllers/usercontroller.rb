class UserController < ApplicationController


    get '/signup' do
      @user = User.all
      if is_logged_in?
        redirect to "/login"
      else

        erb :"users/signup"
      end
      end

    post '/signup' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
          if @user.save
             session[:user_id] = @user.id
             redirect "/appointments"
         else
            redirect '/signup'
         end
     end

    get '/login' do
        if is_logged_in?
          redirect "/appointments"
        else
        erb :"users/login"
        end
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
           if @user && @user.authenticate(params[:password])
             session[:user_id]=@user.id
              redirect "/appointments"

           else
              redirect '/login'
           end

       end

    get '/users/:slug/logout' do

       if is_logged_in?
         session.clear
         redirect '/login'
    end

end


      get '/users/:slug' do
          @user = User.find_by_slug(params[:slug]) #says not a thing??
          @time = Time.now
          @apointment = Appointment.find_by(params[:appointment])
          if @user.id !=nil && @user.id==@appointment.user_id

           erb :"users/home"
       end
end

end
