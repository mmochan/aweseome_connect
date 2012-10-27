class AppdotnetSocialsController < ApplicationController
  # GET /appdotnet_socials
  # GET /appdotnet_socials.json
  
  require 'open-uri'
  before_filter :authenticate_user!
  
  def index
    @appdotnet_socials = AppdotnetSocial.all
    if @appdotnet_socials.nil?
      binding.pry
      @user = @appdotnet_socials.first.user
      @token = @appdotnet_socials.first.token
    end

      # id = current_user.identities.find_by_provider('appdotnet')
      # @globalfeeds = JSON.parse(open("https://alpha-api.app.net/stream/0/posts/stream/global").read).first    
      # @post = JSON.parse(open("https://alpha-api.app.net/stream/0/posts/#{id.uid.to_s}?access_token=#{id.oauth_token}").read)    
      # @me = JSON.parse(open("https://alpha-api.app.net/stream/0/users/#{id.uid.to_s}?access_token=#{id.oauth_token}").read)   
      # @following  = JSON.parse(open("https://alpha-api.app.net/stream/0/users/#{id.uid.to_s}/following?access_token=#{id.oauth_token}").read)   
      # @token  = JSON.parse(open("https://alpha-api.app.net/stream/0/token?access_token=#{id.oauth_token}").read)       
    
#    binding.pry   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@appdotnet_socials, @user, @token]}
    end
  end

  # GET /appdotnet_socials/1
  # GET /appdotnet_socials/1.json
  def show
    @appdotnet_social = AppdotnetSocial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appdotnet_social }
    end
  end

  # GET /appdotnet_socials/new
  # GET /appdotnet_socials/new.json
  def new
    @appdotnet_social = AppdotnetSocial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appdotnet_social }
    end
  end

  # GET /appdotnet_socials/1/edit
  def edit
    @appdotnet_social = AppdotnetSocial.find(params[:id])
  end

  # POST /appdotnet_socials
  # POST /appdotnet_socials.json
  def create
    @appdotnet_social = AppdotnetSocial.new(params[:appdotnet_social])

    respond_to do |format|
      if @appdotnet_social.save
        format.html { redirect_to @appdotnet_social, notice: 'Appdotnet social was successfully created.' }
        format.json { render json: @appdotnet_social, status: :created, location: @appdotnet_social }
      else
        format.html { render action: "new" }
        format.json { render json: @appdotnet_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appdotnet_socials/1
  # PUT /appdotnet_socials/1.json
  def update
    @appdotnet_social = AppdotnetSocial.find(params[:id])

    respond_to do |format|
      if @appdotnet_social.update_attributes(params[:appdotnet_social])
        format.html { redirect_to @appdotnet_social, notice: 'Appdotnet social was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appdotnet_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appdotnet_socials/1
  # DELETE /appdotnet_socials/1.json
  def destroy
    @appdotnet_social = AppdotnetSocial.find(params[:id])
    @appdotnet_social.destroy

    respond_to do |format|
      format.html { redirect_to appdotnet_socials_url }
      format.json { head :no_content }
    end
  end
end
