class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]

  # GET /things
  # GET /things.json
  # GET /things.js
  def index
    @things = Thing.all.order('id ASC')
  end

  # GET /sap/1.json
  def show
  end

  # GET /things/1/edit
  def edit
  end

  # PATCH/PUT /things/1
  # PATCH/PUT /things/1.json
  def update
    params[:thing][:time] = @thing.time + params[:thing][:time].to_f if @thing.time

    respond_to do |format|
      if @thing.update(thing_params)
        format.html { redirect_to things_url, notice: 'Thing was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }

        # Realtime push
        message = {:channel => '/things', :data => { :name => @thing.name, :time => @thing.time}}
        uri = URI.parse("http://localhost:9292/faye")
        Net::HTTP.post_form(uri, :message => message.to_json)
      else
        format.html { render :edit }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    @thing.destroy
    respond_to do |format|
      format.html { redirect_to things_url, notice: 'Thing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_thing
      @thing = Thing.find(params[:id])
    end

    def thing_params
      params.require(:thing).permit(:name, :watts, :time)
    end
end