class StashesController < ApplicationController
  
  require "will_paginate"
  include ActiveRecord::Acts::Tree
  
  load_and_authorize_resource
  
  # GET /stashes
  # GET /stashes.json
  def index
    #@parent_stashes = Stash.order('title ASC').where(:parent_id => nil) 
    @stashes = Stash.paginate(:page => params[:page]).order('updated_at DESC')
        
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @stashes_unpaged }
    end
  end

  # GET /stashes/1
  # GET /stashes/1.json
  def show
    @stash = Stash.find(params[:id])
    @metadata = @stash.metadata
    @comments = @stash.comments.where(:parent_id => nil)
    #puts "Controller @metadata inspect #{@metadata.inspect}"
    Rails.logger.debug "Controller @metadata inspect #{@metadata.inspect}"
    @stash_children = @stash.children
    
    ## If the admin user is logged in, get all the stashes for editing/tunnelling
    ## purposes. This could be a performance hit for regular users, so we won't
    ## do it UNLESS the admin is logged in.
    
    if can? :manage, @stash
      @stashes_unpaged = Stash.all
    end
    
    #create a new metadata object, in case the logged in user wants to add a new one
    if can? :manage, Metadatum
      @meta_datum = Metadatum.new
      @meta_datum.stash_id = @stash.id
    end
    
    #create a new comment object, in case a visiting user wants to add a comment
    @new_comment = Comment.new
    @new_comment.stash_id = @stash.id
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @stash }
    end
    
    
    
  end

  # GET /stashes/new
  # GET /stashes/new.json
  def new
    @stash = Stash.new
    
    unless params[:parent_id].blank?
      @stash.parent_id = params[:parent_id]
      @parent_stash = Stash.find(params[:parent_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @stash }
    end
  end

  # GET /stashes/1/edit
  def edit
    @stash = Stash.find(params[:id])
  end

  # POST /stashes
  # POST /stashes.json
  def create
    @stash = Stash.new(params[:stash])
    
    if params["parent_id"]
      @parent_stash = Stash.find(params["parent_id"])
      @stash.parent = @parent_stash
    end

    respond_to do |format|
      if @stash.save
        format.html { redirect_to @stash, :notice => 'Stash was successfully created.' }
        format.json { render :json => @stash, :status => :created, :location => @stash }
      else
        format.html { render :action => "new" }
        format.json { render :json => @stash.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stashes/1
  # PUT /stashes/1.json
  def update
    ## Normal update behavior
    @stash = Stash.find(params[:id])
    
    ## check to make sure we're not adding a networked stash tunnel
    unless params[:create_tunnel] == "true"
      Rails.logger.debug "Regular update"
      respond_to do |format|
        if @stash.update_attributes(params[:stash])
          format.html { redirect_to @stash, :notice => 'Stash was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @stash.errors, :status => :unprocessable_entity }
        end
      end
    else
      
      ## Begin create tunnel behavior
      Rails.logger.debug "Create tunnel behavior begin"
      unless params["stash"]["id"].blank?
        Rails.logger.debug "Params check out"
        Rails.logger.debug "Tunnel to #{params["stash"]["id"]}"
        tunnel_to = (params["stash"]["id"]).to_i
        @tunnel_to_stash = Stash.find(tunnel_to)
        @stash.network_stashes << @tunnel_to_stash
      else
        @stash.errors.add :base, "There was no stash id provided to create a new tunnel."
      end
      
      respond_to do |format|
        if @stash.save
          format.html { redirect_to @stash, :notice => 'Stash was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @stash.errors, :status => :unprocessable_entity }
        end
      end
  
    end ## end create tunnel behavior    
  end

  # DELETE /stashes/1
  # DELETE /stashes/1.json
  def destroy
    @stash = Stash.find(params[:id])
    @stash.destroy

    respond_to do |format|
      format.html { redirect_to stashes_url }
      format.json { head :no_content }
    end
  end
end
