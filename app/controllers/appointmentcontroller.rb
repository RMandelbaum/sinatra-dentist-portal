class AppointmentController < ApplicationController

    get '/appointments' do
      if is_logged_in?
        @user = User.find(session[:user_id])
        @appointments= Appointment.all
        @time = Time.now

      erb :"appointments/index"
    else
      redirect '/login'
    end
    end


      get '/appointments/new' do
        if is_logged_in?
          @user = User.find_by(username: params[:username])

        erb :"/appointments/new"
      else
        redirect '/login'
      end

      end

      post '/appointments' do
        @user = current_user
        @appointment = Appointment.new(title: params[:title], location: params[:location], date: params[:date], user_id: @user.id)
        if @appointment.title.empty? || @appointment.location.empty? || @appointment.date.empty?
          redirect '/appointments/new'
        end
        if @appointment.save
         redirect to "/appointments"
       else
         redirect '/login'
end
      end

      get '/appointments/:id' do
        @appointment = Appointment.find_by_id(params[:id])
        if is_logged_in?

        erb :"/appointments/show"
      else
        redirect '/login'
      end
    end

      get '/appointments/:id/edit' do
        @appointment = Appointment.find_by_id(params[:id])
        if is_logged_in? && @appointment.user == current_user

      erb :"/appointments/edit"
    else
      redirect '/login'
    end
  end

    patch '/appointments/:id' do
      @appointment = Appointment.find_by_id(params[:id])

      if params[:title].empty? || params[:location].empty? || params[:date].empty?
        redirect to "/appointments/#{@appointment.id}/edit"
      elsif is_logged_in? && @appointment.user == current_user
        @appointment.update(title: params[:title], location: params[:location], date: params[:date])

       redirect '/appointments'
     else
       redirect '/login'
     end
    end

    delete '/appointments/:id' do
      @appointment = Appointment.find_by_id(params[:id])
      if is_logged_in? && @appointment.user == current_user
      @appointment.delete
    end

    redirect to '/appointments'


    end



end
