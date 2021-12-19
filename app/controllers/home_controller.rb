class HomeController < ApplicationController
  before_action :authenticate_user!

  # load_and_authorize_resource
  
  def index
    if current_user.role != "admin"
      @medicine = Medicine.where(user_id: current_user.id)
      @symptom = Symptom.where(user_id: current_user.id)
    else
      @medicine = Medicine.all
      @symptom = Symptom.all
    end
  end
end
