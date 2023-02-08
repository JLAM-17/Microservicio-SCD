class Api::V1::PreguntasController < ApplicationController
  def index
    preguntas = Preguntum.all
    render json: preguntas, status:200
  end

  def show
  end
end
