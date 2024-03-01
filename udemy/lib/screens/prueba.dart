import 'package:flutter/material.dart';

List<Map<String, dynamic>> questions = [
  {
    'questionText': '¿Qué lenguaje de programación te gustaría aprender?',
    'answers': [
      {'text': 'Python', 'logo': 'assets/images/python.png'},
      {'text': 'Python', 'logo': 'assets/images/python.png'}],
  },
  {
    'questionText': '¿Has utilizado algún lenguaje de programación anteriormente?',
    'answers': ['Sí', 'No'],
  },
  {
    'questionText': 'Cuánto sabes de X lenguaje de programación que has usado?',
    'answers': ['Poco', 'Algo', 'Mucho', 'Experto'],
  },
  {
    'questionText': '¿Por qué quieres aprender X lenguaje de programación?',
    'answers': ['Por diversión', 'Para ejercitar mi mente', 'Para impulsar mi carrera profesional', 'Para mis estudios'],
  },
  {
    'questionText': '¿Cuál es tu meta de aprendizaje?',
    'answers': ['5 minutos diarios', '10 minutos diarios', '15 minutos diarios', '30 minutos diarios', '1 hora diaria'],
  },
  {
    'questionText': '¿Te gustaría recibir notificaciones para recordarte estudiar?',
    'answers': ['Sí', 'No'],
  },
  {
    'questionText': '¿Prefieres realizar una prueba de nivel para personalizar tu aprendizaje desde el inicio?',
    'answers': ['Sí', 'No'],
  },
];

class DynamicQuestionWidget extends StatefulWidget {
  @override
  _DynamicQuestionWidgetState createState() => _DynamicQuestionWidgetState();
}

class _DynamicQuestionWidgetState extends State<DynamicQuestionWidget> {
  int _currentQuestionIndex = 0;
  String _selectedProgrammingLanguage = '';

  void _answerQuestion(String answer) {
    // Si estamos en la primera pregunta, guarda la respuesta como el lenguaje seleccionado
    if (_currentQuestionIndex == 0) {
      _selectedProgrammingLanguage = answer;
    }

    // Avanza a la siguiente pregunta
    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
Widget build(BuildContext context) {
  String questionText = questions[_currentQuestionIndex]['questionText'];
  
  // Reemplaza "X" con el lenguaje seleccionado en las preguntas relevantes
  if(questionText.contains('X')) {
    questionText = questionText.replaceAll('X', _selectedProgrammingLanguage);
  }

  return Scaffold(
    appBar: AppBar(
      title: Text('Configuración de Perfil'),
      centerTitle: true,
    ),
    body: Center(
      child: _currentQuestionIndex < questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                ...(questions[_currentQuestionIndex]['answers'] as List<Map<String, String>>).map((answerMap) {
                  return ListTile(
                    leading: Image.asset(answerMap['logo']!), // Muestra el logo
                    title: Text(answerMap['text']!), // Muestra el texto
                    onTap: () {
                      _answerQuestion(answerMap['text']!);
                    },
                  );
                  }).toList(),

              ],
            )
          : Center(
              child: Text('Fin del cuestionario'),
            ),
    ),
  );
}

}
