class UsersController < ApplicationController
  def index
  end
  
  def new
    render 'register'
  end
end
