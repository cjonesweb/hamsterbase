class MetadataController < ApplicationController
  # GET /metadata
  # GET /metadata.json
  
  load_and_authorize_resource
  
  def index
    @metadata = Metadatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @metadata }
    end
  end

  # GET /metadata/1
  # GET /metadata/1.json
  def show
    @metadatum = Metadatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @metadatum }
    end
  end

  # GET /metadata/new
  # GET /metadata/new.json
  def new
    @metadatum = Metadatum.new
    
    if can? :manage, Stash
      @stashes_unpaged = Stash.all
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @metadatum }
    end
  end

  # GET /metadata/1/edit
  def edit
    unless params[:came_from_stash].blank?
      @came_from_stash = TRUE
    end
    @metadatum = Metadatum.find(params[:id])
    if can? :manage, Stash
      @stashes_unpaged = Stash.all
    end
  end

  # POST /metadata
  # POST /metadata.json
  def create

    #puts "Params inspect #{params.inspect}"
    
    @metadatum = Metadatum.new(params[:metadatum])
    
    #puts "@metadatum inspect #{@metadatum.inspect}"
    
    came_from_stash = params["came_from_stash"]
    #puts "Came from stash - #{came_from_stash}"
    Rails.logger.debug("Came from stash - #{came_from_stash}")
    
    respond_to do |format|
      Rails.logger.debug "Respond block"
      if @metadatum.save
        Rails.logger.debug "Metadatum successfully saved"
        if came_from_stash.blank?
          #puts "Regular redirect behavior"
          Rails.logger.debug "Regular redirect behavior"
          format.html { redirect_to @metadatum, :notice => 'Metadatum was successfully created.' }
        else
          #puts "Redirect to stash behavior"
          Rails.logger.debug "Redirect to stash behavior"
          format.html { redirect_to stash_path(@metadatum.stash_id), :notice => 'Metadatum was successfully created.' }
        end
        format.json { render :json => @metadatum, :status => :created, :location => @metadatum }
      else
        Rails.logger.debug "Metadatum not saved"
        format.html { render :action => "new" }
        format.json { render :json => @metadatum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /metadata/1
  # PUT /metadata/1.json
  def update
    #puts "Params inspect #{params.inspect}"
    @metadatum = Metadatum.find(params[:id])
    came_from_stash = params["came_from_stash"]
    respond_to do |format|
      if @metadatum.update_attributes(params[:metadatum])
        Rails.logger.debug "update successful"
        Rails.logger.debug "@metadatum.inspect #{@metadatum.inspect}"
        if came_from_stash.blank?
          format.html { redirect_to @metadatum, :notice => 'Metadatum was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to stash_path(@metadatum.stash_id), :notice => 'Metadatum was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render :action => "edit" }
        format.json { render :json => @metadatum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /metadata/1
  # DELETE /metadata/1.json
  def destroy
    came_from_stash = params["came_from_stash"]
    #puts "Came from stash - #{came_from_stash}"
    Rails.logger.debug("Came from stash - #{came_from_stash}")
  
    @metadatum = Metadatum.find(params[:id])
    stash_id = @metadatum.stash_id
    @metadatum.destroy

    respond_to do |format|
      if came_from_stash.blank? 
        format.html { redirect_to metadata_url }
      else
        format.html { redirect_to stash_path(stash_id), :notice => 'Metadatum was successfully deleted.' }
      end
      format.json { head :no_content }
    end
  end
end
