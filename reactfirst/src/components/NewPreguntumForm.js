import React, { useState } from 'react';

function PreguntumForm() {
  const [pregunta, setPregunta] = useState('');
  const [respuesta1, setRespuesta1] = useState('');
  const [respuesta2, setRespuesta2] = useState('');
  const [respuesta3, setRespuesta3] = useState('');
  const [respuesta4, setRespuesta4] = useState('');
  const [respuestaCorrecta, setRespuestaCorrecta] = useState('');
  const [tema, setTema] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();
    // Handle form submission here
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label htmlFor="pregunta">Pregunta:</label>
        <input type="text" id="pregunta" value={pregunta} onChange={(event) => setPregunta(event.target.value)} />
      </div>

      <div>
        <label htmlFor="respuesta1">Respuesta 1:</label>
        <input type="text" id="respuesta1" value={respuesta1} onChange={(event) => setRespuesta1(event.target.value)} />
      </div>

      <div>
        <label htmlFor="respuesta2">Respuesta 2:</label>
        <input type="text" id="respuesta2" value={respuesta2} onChange={(event) => setRespuesta2(event.target.value)} />
      </div>

      <div>
        <label htmlFor="respuesta3">Respuesta 3:</label>
        <input type="text" id="respuesta3" value={respuesta3} onChange={(event) => setRespuesta3(event.target.value)} />
      </div>

      <div>
        <label htmlFor="respuesta4">Respuesta 4:</label>
        <input type="text" id="respuesta4" value={respuesta4} onChange={(event) => setRespuesta4(event.target.value)} />
      </div>

      <div>
        <label htmlFor="respuestaCorrecta">Respuesta correcta:</label>
        <input type="text" id="respuestaCorrecta" value={respuestaCorrecta} onChange={(event) => setRespuestaCorrecta(event.target.value)} />
      </div>

      <div>
        <label htmlFor="tema">Tema:</label>
        <input type="text" id="tema" value={tema} onChange={(event) => setTema(event.target.value)} />
      </div>

      <button type="submit">Create Preguntum</button>
    </form>
  );
}

export default PreguntumForm;
