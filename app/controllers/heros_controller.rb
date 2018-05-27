class HerosController < ApplicationController
    def index
        @heros = Hero.all
        render json: @heros
    end

    def create
        @params = :params
        Hero.create(name: "Hello")
        render json: "Ok"
    end
end
