class Api::V1::PreguntasController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  def index
    preguntas = Preguntum.all
    render json: preguntas, status:200
  end

  def validar_respuesta
  @preguntum = Preguntum.find(params[:id])
  @respuesta = params[:respuesta]
  numero = (@preguntum.respuesta_correcta.to_s)
  @is_correct = @preguntum.send("respuesta_#{numero}").downcase == @respuesta.downcase
  if @is_correct
    @answer = "Correcta"
  else
    @answer = "Incorrecta"
  end
  render json: { "ID Pregunta": params[:id],"Resultado": @answer }

  end
  def generar_preguntas
    num_preguntas = params[:cantidad].to_i
    tema = params[:tema]
    @questions = Preguntum.where(tema: tema).sample(num_preguntas)
    if !Preguntum.where(tema: tema).sample(num_preguntas).blank?
      render json: @questions, :except => :respuesta_correcta, status: :found
    else
      render json: { message: "Preguntas con ese tema no fueron encontradas!" }, status: :bad_request
    end
  end
  def create
    pregunta = Preguntum.create(pregunta_params)
    if pregunta.save
      render json: { message: "Pregunta creada!" }, status: :created
    else
      render json: { message: "Pregunta no fue creada!" }, status: :bad_request
    end
    # render json: { message: "Pregunta guardada!" }, status: :created
  end
  def update
    @pregunta = Preguntum.find(params[:id])
    if @pregunta.update(pregunta_params)
      render json: @pregunta
    else
      render json: { error: "Failed to update pregunta" }, status: :bad_request
    end
  end
  def destroy
    begin
      pregunta = Preguntum.find(params[:id])
      pregunta.destroy
      render json: { message: "Pregunta eliminada: #{pregunta.id}" }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: "Pregunta no encontrada" }, status: :not_found
    rescue => e
      render json: { message: "Ocurrió un error al eliminar la pregunta: #{e.message}" }, status: :internal_server_error
    end
  end
  private

  def pregunta_params
    params.permit(:pregunta, :respuesta_1,:respuesta_2,:respuesta_3,:respuesta_4,:respuesta_correcta,:tema)
  end
  # def generacion_pregunta_params
  #   params.permit(:tema,:cantidad)
  # end
end
