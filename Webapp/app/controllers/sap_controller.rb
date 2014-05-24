class SapController < ApplicationController
  before_action :set_sap, only: [:show, :update]

  # GET /sap/1.json
  def show
    respond_to do |format|
      format.json { render :json => @sap.to_json }
    end
  end

  # PATCH/PUT /sap/1.json
  def update
    respond_to do |format|
      if @sap.update(sap_params)
        format.json { render json: @sap.to_json, status: :ok, location: @sap }
      else
        format.json { render json: @sap.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_sap
      @sap = Sap.find(params[:id])
    end

    def sap_params
      params.require(:sap).permit(:price, :bill)
    end
end
