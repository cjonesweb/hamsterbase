class CommentsController < ApplicationController
  
  load_and_authorize_resource
    
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    Rails.logger.debug "Params inspect: #{params.inspect}"
    
    #puts "Params inspect: #{params.inspect}"
    @comment = Comment.new
    
    came_from_stash = params["came_from_stash"]
    @came_from_stash = nil
    if came_from_stash == "TRUE"
      Rails.logger.debug "setting @came_from_stash"
      @came_from_stash = TRUE
    end
    
    unless params["parent_id"].blank?
      @parent_comment = Comment.find(params["parent_id"])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    Rails.logger.debug "Params inspect: #{params.inspect}"
    @comment = Comment.new(params[:comment])
    unless params["parent_id"].blank?
      @parent_comment = Comment.find(params["parent_id"])
      @comment.parent = @parent_comment
    end
    
    came_from_stash = params["came_from_stash"]
    #puts "Came from stash - #{came_from_stash}"
    Rails.logger.debug("Came from stash - #{came_from_stash}")
    
    respond_to do |format|
      if @comment.save
        if came_from_stash.blank?
          format.html { redirect_to @comment, :notice => 'Comment was successfully created.' }
        else
          format.html { redirect_to stash_path(@comment.stash_id), :notice => 'Comment was successfully created. Please be aware that your comment will have to be moderated before it is displayed on this page. This is mostly to weed out spambots and the like. Of course the software that runs this website is a work in progress, so there you go.'}  
        end
        format.json { render :json => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, :notice => 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
