class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  PERPAGE = 8
end
