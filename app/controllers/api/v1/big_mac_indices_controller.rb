class Api::V1::BigMacIndicesController < ApplicationController
  def index
    indexes = BigMacIndex.all

    render json: indexes.to_json, status: :ok
  end
end
