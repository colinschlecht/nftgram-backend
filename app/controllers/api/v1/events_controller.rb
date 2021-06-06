class Api::V1::EventsController < ApplicationController
  # skip_before_action :authorized

  def index
    events = Event.all
    render json: events
  end

  def show
    event = Event.find(params[:id])
    render json: event
  end

  def create
    event = Event.create(event_params)
    render json: event
  end

  private

  def event_params
    params.permit(:id, :event, :user_id, :art_id)
  end
end
