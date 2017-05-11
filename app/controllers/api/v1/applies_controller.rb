class Api::V1::AppliesController < ApplicationController
  before_action :set_apply, only: [:show, :update, :destroy]

  def index
    @applies = Apply.all
    render json: { applies: @apply}, except: [:id, :created_at, :updated_at]
  end

  def show
    render json: @apply
  end

  def create
    @apply = Apply.new(apply_params)
    if @apply.save
      render json: @apply.as_json, status: :created
    else
      render json: {apply: @apply.errors, status: :no_content}
    end
  end

  def destroy
    @apply.destroy
    render json: { deleted_apply: @apply, code: 200, status: :success},
           except: [:created_at, :updated_at]
  end

  def update
    if @apply.update(apply_params)
      render json: @apply
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end

  private
  def set_apply
    @apply = Apply.find(params[:id])
  end

  def apply_params
    params.permit(:read, :invited, :job_id, :geek_id, :id)
  end
end
