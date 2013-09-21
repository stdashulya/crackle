class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
  end

  def users
    @users = User.all
  end
end
