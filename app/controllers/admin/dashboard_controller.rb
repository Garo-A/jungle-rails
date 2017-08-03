class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMINUSER"] , password: ENV["ADMINPASS"]
  
  def show
  end

end
