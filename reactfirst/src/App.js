import React, { Component } from 'react';
class App extends React.Component {
  constructor(props) {
      super(props);
      this.updateSubmit = this.updateSubmit.bind(this);
      this.input = React.createRef();
  }
  updateSubmit(event) {
    event.preventDefault();
    const pregunta = document.getElementById('pregunta').value;
    const respuesta1 = document.getElementById('respuesta1').value;
    const respuesta2 = document.getElementById('respuesta2').value;
    const respuesta3 = document.getElementById('respuesta3').value;
    const respuesta4 = document.getElementById('respuesta4').value;
    const respuestaCorrecta = document.getElementById('respuestaCorrecta').value;
    const tema = document.getElementById('tema').value;


    fetch(`http://localhost:3000/api/v1/preguntas/create?pregunta=${pregunta}&respuesta_1=${respuesta1}&respuesta_2=${respuesta2}&respuesta_3=${respuesta3}&respuesta_4=${respuesta4}&respuesta_correcta=${respuestaCorrecta}&tema=${tema}`, {
      method: 'POST',
      body: '',
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      console.log(data);
      alert('Pregunta creada exitosamente!');
    })
    .catch(error => {
      console.error('There was a problem with your fetch operation:', error);
      alert('Ha ocurrido un error al crear la pregunta');
    });
  }
  render() {
    return (
      <form onSubmit={this.updateSubmit}>
        <div>
          <label htmlFor="pregunta">Pregunta:</label>
          <input type="text" id="pregunta" ref = {this.input} />
        </div>

        <div>
          <label htmlFor="respuesta1">Respuesta 1:</label>
          <input type="text" id="respuesta1" ref = {this.input} />
        </div>

        <div>
          <label htmlFor="respuesta2">Respuesta 2:</label>
          <input type="text" id="respuesta2" ref = {this.input} />
        </div>

        <div>
          <label htmlFor="respuesta3">Respuesta 3:</label>
          <input type="text" id="respuesta3" ref = {this.input} />
        </div>

        <div>
          <label htmlFor="respuesta4">Respuesta 4:</label>
          <input type="text" id="respuesta4" ref = {this.input} />
        </div>

        <div>
          <label htmlFor="respuestaCorrecta">Respuesta correcta:</label>
          <input type="text" id="respuestaCorrecta" ref = {this.input} />
        </div>

        <div>
          <label htmlFor="tema">Tema:</label>
          <input type="text" id="tema" ref = {this.input} />
        </div>

        <button type="submit">Create Preguntum</button>
      </form>
    );
  }
}
export default App;
