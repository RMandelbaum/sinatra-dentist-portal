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
        @appointment = Appointment.new(name: params[:name], month: params[:month], date: params[:date], year: params[:year], user_id: @user.id)
        if @appointment.name.empty? && @appointment.month.empty? && @appointment.date.empty? && @appointment.year.empty?
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

      if params[:name].empty? || params[:month].empty? || params[:date].empty? || params[:year].empty?
        redirect to "/appointments/#{@appointment.id}/edit"
      elsif is_logged_in? && @appointment.user == current_user
        @appointment.update(name: params[:name], month: params[:month], date: params[:date], year: params[:year])

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
