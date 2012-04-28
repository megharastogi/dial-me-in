class CallsController < ApplicationController
  # GET /calls
  # GET /calls.json
  def index
    @calls = Call.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calls }
    end
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
    @call = Call.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call }
    end
  end

  # GET /calls/new
  # GET /calls/new.json
  def new
    @call = Call.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call }
    end
  end

  # GET /calls/1/edit
  def edit
    @call = Call.find(params[:id])
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(params[:call])    

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render json: @call, status: :created, location: @call }

        # Schedule call 
        @iron_client.schedules.create('CallTrigger', {id: @call.id}, {start_at: @call.time})

      else
        format.html { render action: "new" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # Twilio Call for Specific Conference
  def initiate_conference
    @call = Call.find(params[:id])
    @call.participants.each do |participant|
      @twilio_client.account.calls.create({from: '+14155992671', to: "+1#{participant.phone}", url: "http://4u8d.localtunnel.com/calls/#{@call.id}/handle_call"})
    end

    redirect_to @call
  end

  # Place someone into conference
  def handle_call
    @call = Call.find(params[:id])
    render text: "<Response><Dial><Conference>AutoConfCall Room #{@call.id}</Conference></Dial></Response>"
  end

  # Handle incoming Twilio Call for Specific Conference
  def incoming_call
    # Get Conference
    # Match it to a Call.id
    # redirect to calls/id/handle_call
  end

  # PUT /calls/1
  # PUT /calls/1.json
  def update
    @call = Call.find(params[:id])

    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call = Call.find(params[:id])
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url }
      format.json { head :no_content }
    end
  end
end
