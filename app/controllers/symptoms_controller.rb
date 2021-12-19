class SymptomsController < ApplicationController
  before_action :set_symptom, only: %i[ edit update destroy ]

  load_and_authorize_resource
  
  # GET /symptoms or /symptoms.json
  def index
    if current_user.role == 'admin'
      @symptoms = Symptom.all
    else
      @symptoms = Symptom.where(user_id: current_user.id)
    end
  end

  # GET /symptoms/new
  def new
    @symptom = Symptom.new(user_id: current_user.id)
  end

  # GET /symptoms/1/edit
  def edit
  end

  # POST /symptoms or /symptoms.json
  def create
    @symptom = Symptom.new(symptom_params)

    respond_to do |format|
      if @symptom.save
        format.html { redirect_to({ action: :index}, {notice: "Sintoma foi cadastrado com sucesso."}) }
        format.json { render :index, status: :created, location: @symptom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /symptoms/1 or /symptoms/1.json
  def update
    respond_to do |format|
      if @symptom.update(symptom_params)
        format.html { redirect_to({ action: :index}, {notice: "Sintoma foi atualizado com sucesso."}) }
        format.json { render :index, status: :ok, location: @symptom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /symptoms/1 or /symptoms/1.json
  def destroy
    @symptom.destroy
    respond_to do |format|
      format.html { redirect_to symptoms_url, notice: "Sintoma foi excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_symptom
      @symptom = Symptom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def symptom_params
      params.require(:symptom).permit(:name, :user_id)
    end
end
