class Api::V1::BigMacIndicesController < ApplicationController
  before_action :set_big_mac_index, only: [:show, :update, :destroy]

  def index
    indexes = BigMacIndex.all

    render json: indexes, status: :ok
  end

  def latest
    latest_date = BigMacIndex.last.date
    indexes = BigMacIndex.where(date: latest_date)

    render json: indexes, status: :ok
  end

  def show
    render json: @big_mac_index, status: :ok
  end

  def create
    @big_mac_index = BigMacIndex.new(big_mac_index_params)

    if @big_mac_index.save
      render json: @big_mac_index, status: :created
    else
      render json: @big_mac_index.errors, status: :unprocessable_entity
    end
  end

  def update
    if @big_mac_index.update(big_mac_index_params)
      render json: @big_mac_index, status: :ok
    else
      render json: @big_mac_index.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @big_mac_index.destroy
  end

  private

  def set_big_mac_index
    @big_mac_index = BigMacIndex.find(params[:id])
  end

  def big_mac_index_params
    params.require(:big_mac_index).permit(:date, :iso_a3, :currency_code, :name, :local_price,
                                          :dollar_ex, :dollar_price, :USD_raw, :EUR_raw, :GBP_raw,
                                          :JPY_raw, :CNY_raw, :GDP_dollar, :adj_price, :USD_adjusted,
                                          :EUR_adjusted, :GBP_adjusted, :JPY_adjusted, :CNY_adjusted)
  end
end
