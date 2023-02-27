class AddPreguntaToPreguntum < ActiveRecord::Migration[7.0]
  def change
    add_column :pregunta, :tema, :string
  end
end
