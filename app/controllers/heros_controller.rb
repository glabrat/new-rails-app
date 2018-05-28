class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :update, :destroy]

  # GET /heros
  def index
    @heros = Hero.all

    json_response(@heros)
  end

  # GET /heros/:id
  def show
    set_hero

    if stale?(last_modified: @hero.updated_at)
      json_response(@hero)
    end
  end

  # POST /heros
  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      render json: @hero, status: :created, location: @hero
    else
      json_response(@hero.errors, :unprocessable_entity)
    end
  end

  # PATCH/PUT /heros/:id
  def update
    set_hero
    if @hero.update(hero_params)
      #http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
      json_response(@hero, :no_content)
    else
      json_response(@hero.errors, :unprocessable_entity)
    end
  end

  # DELETE /heros/:id
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
