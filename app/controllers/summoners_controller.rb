class SummonersController < ApplicationController
  # GET /summoners
  # GET /summoners.json
  def index
    @summoners = Summoner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @summoners }
    end
  end

  # GET /summoners/1
  # GET /summoners/1.json
  def show
    @summoner = Summoner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @summoner }
    end
  end

  # GET /summoners/new
  # GET /summoners/new.json
  def new
    @summoner = Summoner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @summoner }
    end
  end

  # GET /summoners/1/edit
  def edit
    @summoner = Summoner.find(params[:id])
  end

  # POST /summoners
  # POST /summoners.json
  def create
    @summoner = Summoner.new(params[:summoner])

    respond_to do |format|
      if @summoner.save
        format.html { redirect_to @summoner, notice: 'Summoner was successfully created.' }
        format.json { render json: @summoner, status: :created, location: @summoner }
      else
        format.html { render action: "new" }
        format.json { render json: @summoner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /summoners/1
  # PUT /summoners/1.json
  def update
    @summoner = Summoner.find(params[:id])

    respond_to do |format|
      if @summoner.update_attributes(params[:summoner])
        format.html { redirect_to @summoner, notice: 'Summoner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @summoner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summoners/1
  # DELETE /summoners/1.json
  def destroy
    @summoner = Summoner.find(params[:id])
    @summoner.destroy

    respond_to do |format|
      format.html { redirect_to summoners_url }
      format.json { head :no_content }
    end
  end
end
