class RoutesController < ApplicationController
  before_action :set_train, only [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def show
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route, notice: 'Маршрут успешно создан.'
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end
  private

  def route_params
    params.require(:route).permit(:name)
  end

  def set_train
    @route = Route.find(params[:id])
  end
end