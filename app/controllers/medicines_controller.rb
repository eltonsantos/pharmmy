class MedicinesController < ApplicationController
  before_action :set_medicine, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  # GET /medicines or /medicines.json
  def index
    if current_user.role == :admin
      @q = Medicine.ransack(params[:q])
      @medicines = @q.result
    else
      @medicines = Medicine.where(user_id: current_user.id)
    end   
  end

  # GET /medicines/1 or /medicines/1.json
  def show
  end

  # GET /medicines/new
  def new
    @medicine = Medicine.new(user_id: current_user.id)
  end

  # GET /medicines/1/edit
  def edit
  end

  # POST /medicines or /medicines.json
  def create
    @medicine = Medicine.new(medicine_params)

    respond_to do |format|
      if @medicine.save
        format.html { redirect_to @medicine, notice: "Remédio salvo com sucesso." }
        format.json { render :show, status: :created, location: @medicine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicines/1 or /medicines/1.json
  def update
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to @medicine, notice: "Remédio atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @medicine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medicine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicines/1 or /medicines/1.json
  def destroy
    @medicine.destroy
    respond_to do |format|
      format.html { redirect_to medicines_url, notice: "Remédio excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @medicine = Medicine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medicine_params
      params.require(:medicine).permit(:picture, :name, :quantity, :medicine_validity, :medicine_insert, :used_to, :purchase_date, :user_id, category_ids: [])
    end
end
