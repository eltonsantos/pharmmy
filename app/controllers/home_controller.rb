class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @medicines = Medicine.all
  end
end
