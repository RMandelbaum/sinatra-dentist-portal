class AppointmentController < ApplicationController

    get '/appointments' do

      erb :"appointments/index"
    end


      get '/appointments/new' do

        erb :"/appointments/new"

      end

      post '/appointments' do

        @appointment = Appointment.create(name: params[:name], content: params[:content])

        # redirect to "/appointments/#{@appointment.id}"

      end

      get '/appointments/:id' do

        erb :"/appointments/show"
      end

end
