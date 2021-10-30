class HomeController < ApplicationController
  before_action :authenticate_user!

  # load_and_authorize_resource
  
  def index
    @medicines = Medicine.all
  end
end
