class HomeController < ApplicationController
  skip_before_filter :user_access_denied
  def index
  end
end
