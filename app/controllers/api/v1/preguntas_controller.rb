class Api::V1::PreguntasController < ApplicationController
  def index
    preguntas = Preguntum.all
    render json: preguntas, status:200
  end
  def create
    pregunta = Preguntum.create(pregunta_params)
    render json: pregunta
  end
  def update
    pregunta = Preguntum.find(params[:id])
    pregunta.update_attributes(pregunta_params)
    render json: pregunta
  end
  def destroy
  Preguntum.destroy(params[:id])
  end
  private

  def pregunta_params
    params.permit(:pregunta, :respuesta_1,:respuesta_2,:respuesta_3,:respuesta_4,:respuesta_correcta)
  end
end
