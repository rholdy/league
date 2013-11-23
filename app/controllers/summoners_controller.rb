class SummonersController < ApplicationController
  before_filter :set_unirest_header
  # GET /summoners
  # GET /summoners.json
  def index
    @summoners = current_user.summoners.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @summoners }
    end
  end

  # GET /summoners/1
  # GET /summoners/1.json
  def show
    @summoner = current_user.summoners.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @summoner }
      format.js
    end
  end

  # GET /summoners/new
  # GET /summoners/new.json
  def new
    @summoner = current_user.summoners.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @summoner }
      format.js
    end
  end

  # GET /summoners/1/edit
  def edit
    @summoner = current_user.summoners.find(params[:id])
  end

  # POST /summoners
  # POST /summoners.json
  def create
    @summoner = current_user.summoners.new(params[:summoner])

    server = params[:summoner][:server].downcase
    summoner_name = params[:summoner][:summoner_name]

    search_string = "https://teemojson.p.mashape.com/player/#{server}/#{summoner_name}"
    response = Unirest.get(search_string).body["data"]

    if response.present?
      @summoner.account_id = response["accountId"]
      @summoner.in_game_id = response["summonerId"]
      @summoner.summoner_icon = response["icon"]
      @summoner.summoner_level = response["level"]
    end

    search_string = "https://teemojson.p.mashape.com/player/#{server}/#{summoner_name}/honor"
    response = Unirest.get(search_string).body["data"]

    if response.present?
      @summoner.honor_friendly = response["totals"][1]
      @summoner.honor_helpful = response["totals"][2]
      @summoner.honor_teamwork = response["totals"][3]
      @summoner.honor_opponent = response["totals"][4]
    end

    search_string = "https://teemojson.p.mashape.com/player/#{server}/#{summoner_name}/influence_points"
    response = Unirest.get(search_string).body["data"]

    if response.present?
      @summoner.lifetime_ip = response
    end

    search_string = "https://teemojson.p.mashape.com/player/#{server}/#{summoner_name}/past_seasons"
    response = Unirest.get(search_string).body["data"]

    if response.present?
      @summoner.season_one = response["seasonOne"]
      @summoner.season_two = response["seasonTwo"]
    end

    respond_to do |format|
      if @summoner.save
        format.html { redirect_to summoner_path(@summoner), notice: 'Summoner was successfully created.' }
        format.json { render json: @summoner, status: :created, location: @summoner }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @summoner.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /summoners/1
  # PUT /summoners/1.json
  def update
    @summoner = current_user.summoners.find(params[:id])

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
    @summoner = current_user.summoners.find(params[:id])
    @summoner.destroy

    respond_to do |format|
      format.html { redirect_to summoners_url }
      format.json { head :no_content }
    end
  end

  def set_unirest_header
    Unirest.default_header("X-Mashape-Authorization",ENV['MASHAPE_KEY'])
  end
end
