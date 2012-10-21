class FacebookSocialsController < ApplicationController
  # GET /facebook_socials
  # GET /facebook_socials.json
  before_filter :authenticate_user!
  def index
    @facebook_socials = FacebookSocial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facebook_socials }
    end
  end

  # GET /facebook_socials/1
  # GET /facebook_socials/1.json
  def show
    @facebook_social = FacebookSocial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @facebook_social }
    end
  end

  # GET /facebook_socials/new
  # GET /facebook_socials/new.json
  def new
    @facebook_social = FacebookSocial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facebook_social }
    end
  end

  # GET /facebook_socials/1/edit
  def edit
    @facebook_social = FacebookSocial.find(params[:id])
  end

  # POST /facebook_socials
  # POST /facebook_socials.json
  def create
    @facebook_social = FacebookSocial.new(params[:facebook_social])

    respond_to do |format|
      if @facebook_social.save
        format.html { redirect_to @facebook_social, notice: 'Facebook social was successfully created.' }
        format.json { render json: @facebook_social, status: :created, location: @facebook_social }
      else
        format.html { render action: "new" }
        format.json { render json: @facebook_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facebook_socials/1
  # PUT /facebook_socials/1.json
  def update
    @facebook_social = FacebookSocial.find(params[:id])

    respond_to do |format|
      if @facebook_social.update_attributes(params[:facebook_social])
        format.html { redirect_to @facebook_social, notice: 'Facebook social was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facebook_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebook_socials/1
  # DELETE /facebook_socials/1.json
  def destroy
    @facebook_social = FacebookSocial.find(params[:id])
    @facebook_social.destroy

    respond_to do |format|
      format.html { redirect_to facebook_socials_url }
      format.json { head :no_content }
    end
  end
end
