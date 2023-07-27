import 'package:flutter/material.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _currentIndex = 0;
  int _correctAnswers = 0;
  int _selectedIndex = -1; // Seçilen cevabın indexini izlemek için ekledik

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'Flutter nedir?',
      'answers': ['Bir programlama dili', 'Bir mobil oyun motoru', 'Bir UI toolkit', 'Bir grafik tasarım aracı'],
      'correctIndex': 2,
    },
    {
      'question': 'Dart hangi şirket tarafından geliştirilmiştir?',
      'answers': ['Google', 'Apple', 'Microsoft', 'Facebook'],
      'correctIndex': 0,
    },
    {
      'question': 'Widgetlar ne demektir?',
      'answers': ['Taşınabilir', 'Görüntüler', 'Arayüz elemanları', 'Veritabanları'],
      'correctIndex': 2,
    },
    // Buraya sorularınızı ve doğru cevapları ekleyebilirsiniz
  ];

  void _checkAnswer(int selectedIndex) {
    if (_currentIndex < _questions.length) {
      setState(() {
        _selectedIndex = selectedIndex; // Seçilen cevabın indexini güncelle
        if (_questions[_currentIndex]['correctIndex'] == selectedIndex) {
          _correctAnswers++;
        }
        _currentIndex++;
        _selectedIndex = -1; // Geçme tuşuna basıldığında seçimi sıfırla
      });
    }
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length) {
      setState(() {
        _currentIndex++;
        _selectedIndex = -1; // Geçme tuşuna basıldığında seçimi sıfırla
      });
    }
  }

  void _restartTest() {
    setState(() {
      _currentIndex = 0;
      _correctAnswers = 0;
      _selectedIndex = -1; // Testi yeniden başlatınca seçimi sıfırlayın
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Uygulaması'),
      ),
      body: _currentIndex < _questions.length
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Soru ${_currentIndex + 1} / ${_questions.length}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _questions[_currentIndex]['question'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.black87),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ...(_questions[_currentIndex]['answers'] as List<String>).map((answer) {
              int index = _questions[_currentIndex]['answers'].indexOf(answer);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
                child: ElevatedButton(
                  onPressed: () => _checkAnswer(index),
                  child: Text(answer),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (states) {
                        if (_currentIndex < _questions.length) {
                          if (index == _questions[_currentIndex]['correctIndex']) {
                            return _selectedIndex == index ? Colors.green : Colors.blue;
                          } else if (index == _selectedIndex) {
                            return Colors.red;
                          }
                        }
                        return Colors.blue; // Normal renk
                      },
                    ),
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                      return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      );
                    }),
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _nextQuestion,
              child: Text('Geç'),
            ),
          ],
        ),
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Test Tamamlandı!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Doğru Cevaplar: $_correctAnswers / ${_questions.length}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _restartTest,
              child: Text('Testi Yeniden Başlat'),
            ),
          ],
        ),
      ),
    );
  }
}
