class TwitterSocialsController < ApplicationController
  # GET /twitter_socials
  # GET /twitter_socials.json
  before_filter :authenticate_user!
  def index
    @twitter_socials = TwitterSocial.all
#    auth.extra.access_token.params[:oauth_token_secret


    


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @twitter_socials }
    end
  end

  # GET /twitter_socials/1
  # GET /twitter_socials/1.json
  def show
    @twitter_social = TwitterSocial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @twitter_social }
    end
  end

  # GET /twitter_socials/new
  # GET /twitter_socials/new.json
  def new
    @twitter_social = TwitterSocial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @twitter_social }
    end
  end

  # GET /twitter_socials/1/edit
  def edit
    @twitter_social = TwitterSocial.find(params[:id])
  end

  # POST /twitter_socials
  # POST /twitter_socials.json
  def create
    @twitter_social = TwitterSocial.new(params[:twitter_social])

    respond_to do |format|
      if @twitter_social.save
        format.html { redirect_to @twitter_social, notice: 'Twitter social was successfully created.' }
        format.json { render json: @twitter_social, status: :created, location: @twitter_social }
      else
        format.html { render action: "new" }
        format.json { render json: @twitter_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /twitter_socials/1
  # PUT /twitter_socials/1.json
  def update
    @twitter_social = TwitterSocial.find(params[:id])

    respond_to do |format|
      if @twitter_social.update_attributes(params[:twitter_social])
        format.html { redirect_to @twitter_social, notice: 'Twitter social was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @twitter_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_socials/1
  # DELETE /twitter_socials/1.json
  def destroy
    @twitter_social = TwitterSocial.find(params[:id])
    @twitter_social.destroy

    respond_to do |format|
      format.html { redirect_to twitter_socials_url }
      format.json { head :no_content }
    end
  end
end
