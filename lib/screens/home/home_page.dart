import 'package:flutter/material.dart';

// TODO: ใส่รหัสนักศึกษาที่ค่าสตริงนี้
const studentId = '630710657';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentQuestionIndex = 0; // เพิ่มตัวแปรเก็บคำถามปัจจุบัน
  String selectedAnswer = ''; // เพิ่มตัวแปรเก็บคำตอบที่ผู้ใช้เลือก

  final List<Map<String, String>> quizData = [
    {
      'question': 'What is the capital of France?',
      'answerA': 'Paris',
      'answerB': 'London',
      'answerC': 'Berlin',
      'answerD': 'Madrid',
      'correctAnswer': 'A',
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'answerA': 'Mars',
      'answerB': 'Venus',
      'answerC': 'Jupiter',
      'answerD': 'Saturn',
      'correctAnswer': 'C',
    },
    {
      'question': 'Who wrote the play "Romeo and Juliet"?',
      'answerA': 'Charles Dickens',
      'answerB': 'William Shakespeare',
      'answerC': 'Jane Austen',
      'answerD': 'Mark Twain',
      'correctAnswer': 'B',
    },
    {
      'question': 'What is the chemical symbol for the element oxygen?',
      'answerA': 'Ox',
      'answerB': 'Oxy',
      'answerC': 'Oxide',
      'answerD': 'O',
      'correctAnswer': 'D',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'answerA': 'Earth',
      'answerB': 'Mars',
      'answerC': 'Venus',
      'answerD': 'Mercury',
      'correctAnswer': 'B',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_colorful.jpg"),
              opacity: 0.6,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Good Morning',
                  textAlign: TextAlign.center, style: textTheme.headlineMedium),
              Text(studentId,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              Spacer(),
              _buildQuizView(),
              Spacer(),
              _buildButtonPanel(),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  _buildQuizView() {
    final currentQuestion = quizData[currentQuestionIndex];
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), //
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Question ${currentQuestionIndex + 1} of ${quizData.length}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                color: Colors.green.shade300,
              ),
              child: Text(
                currentQuestion['question'] ?? '',
                style: TextStyle(fontSize: 24,color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            _buildAnswerButton('A', currentQuestion['answerA'] ?? ''),
            _buildAnswerButton('B', currentQuestion['answerB'] ?? ''),
            _buildAnswerButton('C', currentQuestion['answerC'] ?? ''),
            _buildAnswerButton('D', currentQuestion['answerD'] ?? ''),
          ],
        ),
      ),
    );
  }

  _buildButtonPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            _showPreviousQuestion();
          },
          child: Text('Previous'),
        ),
        ElevatedButton(
          onPressed: () {
            _showNextQuestion();
          },
          child: Text('Next'),
        ),
      ],
    );
  }

  Widget _buildAnswerButton(String iconText, String answerText) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedAnswer = iconText;
          });
          _checkAnswer();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.circle, size: 20, color: Colors.black), // เปลี่ยนสีของไอคอนเป็นสีดำ
                SizedBox(width: 10.0),
                Text(iconText, style: TextStyle(fontSize: 20)),
              ],
            ),
            Text(answerText, style: TextStyle(fontSize: 20, color: Colors.black)), // เปลี่ยนสีของคำตอบเป็นสีดำ
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: iconText == selectedAnswer ? Colors.green : Colors.white70, // ปรับสีพื้นหลังเมื่อเลือกคำตอบถูกหรือผิด
        ),
      ),
    );
  }

  void _checkAnswer() {
    final currentQuestion = quizData[currentQuestionIndex];
    if (selectedAnswer == currentQuestion['correctAnswer']) {
      // คำตอบถูกต้อง
      // เพิ่มโค้ดเมื่อคำตอบถูกต้อง
    } else {
      // คำตอบผิด
      // เพิ่มโค้ดเมื่อคำตอบผิด
    }
  }

  void _showPreviousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
        selectedAnswer = '';
      }
    });
  }

  void _showNextQuestion() {
    setState(() {
      if (currentQuestionIndex < quizData.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = '';
      }
    });
  }
}