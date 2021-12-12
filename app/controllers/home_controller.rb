class HomeController < ApplicationController
  before_action :authenticate_user!

  # load_and_authorize_resource
  
  def index
    @medicine = Medicine.where(user_id: current_user.id)
    @category = Category.where(user_id: current_user.id)
  end
end
