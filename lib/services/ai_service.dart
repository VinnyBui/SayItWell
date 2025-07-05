import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/exercise.dart';

class AIService {
  //we say late because we only want to init after dotenv is loaded
  late final OpenAI _openAI;

  AIService() {
    _openAI = OpenAI.instance.build(
      token: dotenv.env['OPENAI_API_KEY'],
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 30)),
    );
  }

  Future<Exercise> generateTongueTwister() async {
    String userPrompt =
        'Generate a tongue twister exercise. Return your response in this exact format:\n\nDESCRIPTION: [Brief explanation of what this exercise helps with]\n\nCONTENT: [The actual tongue twister sentences to practice - 2-3 sentences that make sense and tell a short story]';

    final request = ChatCompleteText(
      messages: [
        {
          "role": "system",
          "content":
              "You are a speech therapy assistant. Always follow the exact format requested.",
        },
        {"role": "user", "content": userPrompt},
      ],
      model: Gpt4OChatModel(),
      maxToken: 300,
    );

    ChatCTResponse? response = await _openAI.onChatCompletion(request: request);

    if (response?.choices.isNotEmpty == true) {
      String aiResponse = response!.choices.first.message!.content.trim();

      // Parse the response to separate description and content
      final parts = _parseAIResponse(aiResponse);

      return Exercise(
        id: 'ai_tongue_twister_${DateTime.now().millisecondsSinceEpoch}',
        title: 'Tongue Twister',
        description:
            parts['description'] ??
            'Practice clear pronunciation with challenging tongue twisters.',
        content:
            parts['content'] ?? 'Unable to generate tongue twister content.',
        type: 'tongue_twister',
        duration: 3,
      );
    }

    throw Exception('Failed to generate Tongue Twister exercise');
  }

  Future<Exercise> generateVolumeControl() async {
    // Throw error if OpenAI is not available
    if (_openAI == null) {
      throw Exception('AI service not available');
    }

    String userPrompt =
        'Create a volume control exercise. Return your response in this exact format:\n\nDESCRIPTION: [Brief explanation of what this exercise helps with]\n\nCONTENT: [A meaningful paragraph of 4-6 sentences that users should practice reading at different volumes]';

    final request = ChatCompleteText(
      messages: [
        {
          "role": "system",
          "content":
              "You are a speech therapy assistant. Always follow the exact format requested.",
        },
        {"role": "user", "content": userPrompt},
      ],
      model: Gpt4OChatModel(),
      maxToken: 300,
    );

    ChatCTResponse? response = await _openAI!.onChatCompletion(
      request: request,
    );

    if (response?.choices.isNotEmpty == true) {
      String aiResponse = response!.choices.first.message!.content.trim();

      final parts = _parseAIResponse(aiResponse);

      return Exercise(
        id: 'ai_volume_${DateTime.now().millisecondsSinceEpoch}',
        title: 'Volume Control',
        description:
            parts['description'] ??
            'Learn to project your voice effectively and control volume.',
        content:
            parts['content'] ?? 'Unable to generate volume control content.',
        type: 'volume',
        duration: 4,
      );
    }

    throw Exception('Failed to generate Volume Control exercise');
  }

  Future<Exercise> generateSlowDown() async {
    String userPrompt =
        'Generate a pacing exercise. Return your response in this exact format:\n\nDESCRIPTION: [Brief explanation of what this exercise helps with]\n\nCONTENT: [A coherent paragraph of 2-3 sentences about an interesting topic that users should practice reading at different speeds]';

    final request = ChatCompleteText(
      messages: [
        {
          "role": "system",
          "content":
              "You are a speech therapy assistant. Always follow the exact format requested.",
        },
        {"role": "user", "content": userPrompt},
      ],
      model: Gpt4OChatModel(),
      maxToken: 300,
    );

    ChatCTResponse? response = await _openAI.onChatCompletion(request: request);

    if (response?.choices.isNotEmpty == true) {
      String aiResponse = response!.choices.first.message!.content.trim();

      final parts = _parseAIResponse(aiResponse);

      return Exercise(
        id: 'ai_pace_${DateTime.now().millisecondsSinceEpoch}',
        title: 'Slow Down',
        description:
            parts['description'] ??
            'Practice speaking at a controlled pace to improve clarity.',
        content: parts['content'] ?? 'Unable to generate pacing content.',
        type: 'pace',
        duration: 2,
      );
    }

    throw Exception('Failed to generate Slow Down exercise');
  }

  Future<Exercise> generateRepeatAfterMe() async {
    String userPrompt =
        'Create a "repeat after me" exercise. Return your response in this exact format:\n\nDESCRIPTION: [Brief explanation of what this exercise helps with]\n\nCONTENT: [4-6 meaningful phrases and sentences that make sense in real conversations, each on a new line. Do NOT include any instructional text like "Repeat after me" - just provide the actual phrases to practice]';

    final request = ChatCompleteText(
      messages: [
        {
          "role": "system",
          "content":
              "You are a speech therapy assistant. Always follow the exact format requested.",
        },
        {"role": "user", "content": userPrompt},
      ],
      model: Gpt4OChatModel(),
      maxToken: 300,
    );

    ChatCTResponse? response = await _openAI.onChatCompletion(request: request);

    if (response?.choices.isNotEmpty == true) {
      String aiResponse = response!.choices.first.message!.content.trim();

      final parts = _parseAIResponse(aiResponse);

      return Exercise(
        id: 'ai_repetition_${DateTime.now().millisecondsSinceEpoch}',
        title: 'Repeat After Me',
        description:
            parts['description'] ??
            'Follow along with clear speech patterns to improve pronunciation.',
        content: parts['content'] ?? 'Unable to generate repetition content.',
        type: 'repetition',
        duration: 3,
      );
    }

    throw Exception('Failed to generate Repeat After Me exercise');
  }

  Map<String, String> _parseAIResponse(String response) {
    Map<String, String> parts = {};

    // Split by lines and look for DESCRIPTION: and CONTENT: markers
    List<String> lines = response.split('\n');
    String currentSection = '';
    String currentContent = '';

    for (String line in lines) {
      if (line.trim().startsWith('DESCRIPTION:')) {
        if (currentSection.isNotEmpty && currentContent.isNotEmpty) {
          parts[currentSection] = currentContent.trim();
        }
        currentSection = 'description';
        currentContent = line.replaceFirst('DESCRIPTION:', '').trim();
      } else if (line.trim().startsWith('CONTENT:')) {
        if (currentSection.isNotEmpty && currentContent.isNotEmpty) {
          parts[currentSection] = currentContent.trim();
        }
        currentSection = 'content';
        currentContent = line.replaceFirst('CONTENT:', '').trim();
      } else if (currentSection.isNotEmpty) {
        currentContent += '\n' + line;
      }
    }

    // Don't forget the last section
    if (currentSection.isNotEmpty && currentContent.isNotEmpty) {
      parts[currentSection] = currentContent.trim();
    }

    return parts;
  }
}
