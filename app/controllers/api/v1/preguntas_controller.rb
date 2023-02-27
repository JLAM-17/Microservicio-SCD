class Api::V1::PreguntasController < ApplicationController
  def index
    preguntas = Preguntum.all
    render json: preguntas, status:200
  end
  def generar_preguntas
    num_preguntas = params[:num_preguntas].to_i
    tema = params[:tema]
    @questions = Preguntum.where(tema: tema).sample(num_preguntas)
    render json: @questions
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
    params.permit(:pregunta, :respuesta_1,:respuesta_2,:respuesta_3,:respuesta_4,:respuesta_correcta,:tema)
  end
end
