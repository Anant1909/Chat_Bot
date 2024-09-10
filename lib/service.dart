import 'package:google_generative_ai/google_generative_ai.dart';

class SolutionService {
  final GenerativeModel _model;

  SolutionService(String apiKey)
      : _model = GenerativeModel(
          model: 'gemini-1.5-flash',
          apiKey: apiKey,
        );

  Future<String?> generatesolution(String text) async {
    final prompt = 'Provide best solution for $text';

    final response = await _model.generateContent(
      [Content.text(prompt)],
    );

    if (response.error != null) {
      throw Exception('Failed to solve your problem: ${response.error!.message}');
    }

    final solution = response.text;

    return solution;
  }
}

extension on GenerateContentResponse {
  get error => null;
}