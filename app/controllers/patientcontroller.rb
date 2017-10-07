class PatientController < ApplicationController


    get '/patients/signup' do
        @dentists = Dentist.all

        erb :"patients/signup"

      end

    post '/patients/signup' do
        @dentist = Dentist.find_by(name: params[:name])
        @patient = Patient.new(username: params[:username], email: params[:email], password: params[:password])
          if @patient.save
             session[:user_id] = @patient.id

             redirect "/patients/#{@patient.slug}"
         else
            redirect '/patients/signup'
         end
     end

    get '/patients/login' do
        if is_logged_in?
          redirect "/patients/#{@patient.slug}"
        else
        erb :"patients/login"
        end
    end

    post '/patients/login' do
        @patient = Patient.find_by(username: params[:username])
           if @patient && @patient.authenticate(params[:password])
              redirect "/patients/#{@patient.slug}"

           else
              redirect '/patients/login'
           end

       end

    get '/patients/:slug/logout' do
       if is_logged_in? && current_user.id == @patient.id
         session.clear
         redirect '/'
    end

end


      get '/patients/:slug' do
          @patient = Patient.find_by(params[:patient]) #says not a thing??

           erb :"/patients/home"
      end


end
