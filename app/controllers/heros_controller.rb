class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :update, :destroy]

  # GET /heros
  def index
    @heros = Hero.all

    render json: @heros
  end

  # GET /heros/:id
  def show
    set_hero

    if stale?(last_modified: @hero.updated_at)
      render json: @hero
    end
  end

  # POST /heros
  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      render json: @hero, status: :created, location: @hero
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heros/1
  def update
    set_hero
    if @hero.update(hero_params)
      render json: @hero
    else
      render json: @hero.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heros/1
  def destroy
    set_hero
    @hero.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hero_params
      params.require(:hero).permit(:name, :status)
    end
end
