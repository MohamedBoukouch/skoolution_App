import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/question_model.dart';
import '../widgets/option_card.dart';
import '../widgets/progress_indicator.dart';
import '../widgets/question_card.dart';
import '../widgets/question_header.dart';
import '../widgets/result_screen.dart';

class TestFetch extends StatefulWidget {
  const TestFetch({super.key});

  @override
  State<TestFetch> createState() => _TestFetchState();
}

class _TestFetchState extends State<TestFetch> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool answerChecked = false;
  int score = 0;
  bool testCompleted = false;
  bool isLoading = true;
  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final response = await http.get(Uri.parse('https://your-api-endpoint/questions.json'));
      // For local assets: final String jsonString = await rootBundle.loadString('assets/questions.json');
      
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        setState(() {
          questions = jsonList.map((json) => Question.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      // Fallback to local questions if API fails
      _loadLocalQuestions();
    }
  }

  void _loadLocalQuestions() {
    // This would be your fallback hardcoded questions
    // Converted from the original list to use the Question model
    setState(() {
      questions = [
        Question(
          title: "Limites et continuité",
          chapter: "Chapitre 2 • Test 2",
          question: "Soit la fonction\n\n\\( f(x) = \\frac{x^2 + 1}{x^2 - 3x + 2} \\)\n\nQuelle est l'assertion vraie concernant les limites ?",
          options: [
            Option(text: "\\( \\lim_{x \\to +\\infty} f(x) = 1 \\)", isCorrect: true, letter: "A"),
            Option(text: "\\( \\lim_{x \\to +\\infty} f(x) = -1 \\)", isCorrect: false, letter: "B"),
            Option(text: "\\( \\lim_{x \\to -\\infty} f(x) = 0 \\)", isCorrect: false, letter: "C"),
            Option(text: "\\( \\lim_{x \\to -\\infty} f(x) = 2 \\)", isCorrect: false, letter: "D"),
          ],
        ),
        // Add other questions here...
      ];
      isLoading = false;
    });
  }

  void checkAnswer(int index) {
    if (!answerChecked) {
      setState(() {
        selectedAnswerIndex = index;
        answerChecked = true;
        if (questions[currentQuestionIndex].options[index].isCorrect) {
          score++;
        }
      });
    }
  }

  void nextQuestion() {
    if (answerChecked) {
      setState(() {
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          selectedAnswerIndex = null;
          answerChecked = false;
        } else {
          testCompleted = true;
        }
      });
    }
  }

  void resetTest() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswerIndex = null;
      answerChecked = false;
      score = 0;
      testCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (testCompleted) {
      return ResultScreen(
        score: score,
        totalQuestions: questions.length,
        onRestart: resetTest,
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test en cours',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionHeader(
              title: currentQuestion.title,
              chapter: currentQuestion.chapter,
              currentIndex: currentQuestionIndex + 1,
              totalQuestions: questions.length,
            ),
            const SizedBox(height: 24),
            CustomProgressIndicator(
              currentValue: currentQuestionIndex + 1,
              maxValue: questions.length,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionCard(question: currentQuestion.question),
                    const SizedBox(height: 32),
                    Column(
                      children: List.generate(
                        currentQuestion.options.length,
                        (index) => OptionCard(
                          option: currentQuestion.options[index],
                          isSelected: selectedAnswerIndex == index,
                          answerChecked: answerChecked,
                          onTap: () => checkAnswer(index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: answerChecked ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blue[800],
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: Text(
                  currentQuestionIndex < questions.length - 1
                      ? 'Continuer'
                      : 'Terminer le test',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}