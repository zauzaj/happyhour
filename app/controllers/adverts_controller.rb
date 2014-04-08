class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy, :hello]

  # GET /adverts
  # GET /adverts.json
  def index
    @adverts = Advert.active
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
    @comments = @advert.comments
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
  end

  # GET /adverts/1/editgit 
  def edit
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = Advert.new(advert_params)
    respond_to do |format|
      if @advert.save
        raise
        format.html { redirect_to @advert, notice: 'Advert was successfully created.' }
        format.json { render action: 'show', status: :created, location: @advert }
      else
        format.html { render action: 'new' }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverts/1
  # PATCH/PUT /adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: 'Advert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params[:advert].permit(:title, :description, :address, :location, :phone_number, :is_commentable, :payment_method, :user_id, :category_id)
      raise
    end
end
