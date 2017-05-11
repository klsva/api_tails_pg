class Api::V1::GeeksController < ApplicationController
  before_action :set_geek, only: [:show, :update, :destroy]

  def index
    @geeks = Geek.all
    render json: { geeks: @geek}, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @geek
  end

  def create
    @geek = Geek.new(geek_params)
    if @geek.save
      render json: @geek.as_json, status: :created
    else
      render json: {geek: @geek.errors, status: :no_content}
    end
  end

  def destroy
    @geek.destroy
    render json: { deleted_geek: @geek, code: 200, status: :success},
           except: [:created_at, :updated_at]
  end

  def update
    if @geek.update(geek_params)
      render json: @geek
    else
      render json: @geek.errors, status: :unprocessable_entity
    end
  end

  private
  def set_geek
    @geek = Geek.find(params[:id])
  end

  def geek_params
    params.permit(:name, :stack, :resume, :id)
  end
end
