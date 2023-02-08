class CreatePregunta < ActiveRecord::Migration[7.0]
  def change
    create_table :pregunta do |t|
      t.string :pregunta
      t.string :respuesta_1
      t.string :respuesta_2
      t.string :respuesta_3
      t.string :respuesta_4
      t.integer :respuesta_correcta

      t.timestamps
    end
  end
end
