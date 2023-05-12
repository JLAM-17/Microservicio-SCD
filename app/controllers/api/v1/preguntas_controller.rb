class Api::V1::PreguntasController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  def index
    preguntas = Preguntum.all
    render json: preguntas, status:200
  end

  def validar_respuesta
  @preguntum = Preguntum.find(params[:id])
  @respuesta = sanitize(params[:respuesta])
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
    num_preguntas = sanitize(params[:cantidad].to_i)
    tema = sanitize(params[:tema])
    @questions = Preguntum.where(tema: tema).sample(num_preguntas)
    render json: @questions, :except => :respuesta_correcta
  end
  def create
    pregunta = Preguntum.create(pregunta_params)
    if pregunta.save
      render json: { message: "Pregunta creada!" }, status: :created
    else
      render json: { errors: @resource.errors.full_messages }, status: :unprocessable_entity
    end
    # render json: { message: "Pregunta guardada!" }, status: :created
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
  # def generacion_pregunta_params
  #   params.permit(:tema,:cantidad)
  # end
end
