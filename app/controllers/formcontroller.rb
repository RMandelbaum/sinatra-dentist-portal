class FormController < ApplicationController

    get '/forms' do

      erb :"forms/index"
    end


      get '/forms/new' do

        erb :"/forms/new"

      end

      post '/forms' do

        @form = Form.create(name: params[:name], content: params[:content])

        # redirect to "/forms/#{@form.id}"

      end

      get '/forms/:id' do

        erb :"/forms/show"
      end

end
