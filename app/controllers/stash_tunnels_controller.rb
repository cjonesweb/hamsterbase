class StashTunnelsController < ApplicationController
  # GET /stash_tunnels
  # GET /stash_tunnels.json
  
  load_and_authorize_resource
  
  def index
    @stash_tunnels = StashTunnel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @stash_tunnels }
    end
  end

  # GET /stash_tunnels/1
  # GET /stash_tunnels/1.json
  def show
    @stash_tunnel = StashTunnel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @stash_tunnel }
    end
  end

  # GET /stash_tunnels/new
  # GET /stash_tunnels/new.json
  def new
    @stash_tunnel = StashTunnel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @stash_tunnel }
    end
  end

  # GET /stash_tunnels/1/edit
  def edit
    @stash_tunnel = StashTunnel.find(params[:id])
    @stashes_unpaged = Stash.all
  end

  # POST /stash_tunnels
  # POST /stash_tunnels.json
  def create
    @stash_tunnel = StashTunnel.new(params[:stash_tunnel])
    @stashes_unpaged = Stash.all
    respond_to do |format|
      if @stash_tunnel.save
        format.html { redirect_to @stash_tunnel, :notice => 'Stash tunnel was successfully created.' }
        format.json { render :json => @stash_tunnel, :status => :created, :location => @stash_tunnel }
      else
        format.html { render :action => "new" }
        format.json { render :json => @stash_tunnel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stash_tunnels/1
  # PUT /stash_tunnels/1.json
  def update
    @stash_tunnel = StashTunnel.find(params[:id])

    respond_to do |format|
      if @stash_tunnel.update_attributes(params[:stash_tunnel])
        format.html { redirect_to @stash_tunnel, :notice => 'Stash tunnel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @stash_tunnel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stash_tunnels/1
  # DELETE /stash_tunnels/1.json
  def destroy
    @stash_tunnel = StashTunnel.find(params[:id])
    @stash_tunnel.destroy

    respond_to do |format|
      format.html { redirect_to stash_tunnels_url }
      format.json { head :no_content }
    end
  end
end
