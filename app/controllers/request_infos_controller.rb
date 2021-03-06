class RequestInfosController < ApplicationController
  before_action :set_request_info, only: [:show, :edit, :update, :destroy]

  # GET /request_infos
  # GET /request_infos.json
  def index
    @request_infos = RequestInfo.all
  end

  # GET /request_infos/1
  # GET /request_infos/1.json
  def show
  end

  # GET /request_infos/new
  def new
    @request_info = RequestInfo.new
  end

  # GET /request_infos/1/edit
  def edit
  end

  # POST /request_infos
  # POST /request_infos.json
  def create
    @request_info = RequestInfo.new(request_info_params)

    respond_to do |format|
      if @request_info.save
        format.html { redirect_to @request_info, notice: 'Thank you for your interest, somebody will be in touch soon to.' }
        format.json { render action: 'show', status: :created, location: @request_info }
      else
        format.html { render action: 'new' }
        format.json { render json: @request_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_infos/1
  # PATCH/PUT /request_infos/1.json
  def update
    respond_to do |format|
      if @request_info.update(request_info_params)
        format.html { redirect_to @request_info, notice: 'Request info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_infos/1
  # DELETE /request_infos/1.json
  def destroy
    @request_info.destroy
    respond_to do |format|
      format.html { redirect_to request_infos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_info
      @request_info = RequestInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_info_params
      params.require(:request_info).permit(:first_name, :last_name, :email, :comments, :query)
    end
end
