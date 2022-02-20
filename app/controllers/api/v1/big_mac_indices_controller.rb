class Api::V1::BigMacIndicesController < ApplicationController
  def index
    indexes = BigMacIndex.all

    render json: indexes, status: :ok
  end

  def latest
    latest_date = BigMacIndex.last.date
    indexes = BigMacIndex.where(date: latest_date)

    render json: indexes, status: :ok
  end
end
