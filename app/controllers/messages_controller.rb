# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update destroy]

  # GET /messages
  def index
    @messages = Message.all
  end

  # GET /messages/1
  def show; end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit; end

  # POST /messages
  def create
    @message = Message.new(message_params.merge(user: current_user))

    if @message.save
      respond_to do |format|
        format.html do
          redirect_to @message.room, notice: 'Message was successfully created.'
        end
        format.js do
          head :ok
        end
      end
    else
      render :new
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:parent_id, :room_id, :topic_name, :body, :user_id)
  end
end
