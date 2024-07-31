class SessionsController < ApplicationController
  def new
  end

  def create
    
    code = params[:code]
    
    conn = Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})
    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = Rails.application.credentials.github[:client_id]
      req.params['client_secret'] = Rails.application.credentials.github[:client_secret]
    end
    data = JSON.parse(response.body, symbolize_names: true)
    
    access_token = data[:access_token]
    
    conn = Faraday.new(url: 'https://api.github.com', headers: {'Authorization': "token #{access_token}"})
    response = conn.get('/user')
    data = JSON.parse(response.body, symbolize_names: true)
    
    #binding.pry
    user = User.find_or_create_by(uid: data[:id], username: data[:login])

    user.save

    session[:user] = user
    redirect_to dashboard_path
  end

  
end