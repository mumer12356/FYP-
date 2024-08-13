
import '../../../../../utils/constants/exports.dart';

// Function to calculate Levenshtein distance
int levenshtein(String s1, String s2) {
  if (s1 == s2) return 0;
  if (s1.isEmpty) return s2.length;
  if (s2.isEmpty) return s1.length;

  List<List<int>> matrix = List.generate(
    s1.length + 1,
        (_) => List<int>.filled(s2.length + 1, 0),
  );

  for (int i = 0; i <= s1.length; i++) {
    matrix[i][0] = i;
  }
  for (int j = 0; j <= s2.length; j++) {
    matrix[0][j] = j;
  }

  for (int i = 1; i <= s1.length; i++) {
    for (int j = 1; j   <= s2.length; j++) {
      int cost = (s1[i - 1] == s2[j - 1]) ? 0 : 1;
      matrix[i][j] = [
        matrix[i - 1][j] + 1,
        matrix[i][j - 1] + 1,
        matrix[i - 1][j - 1] + cost,
      ].reduce((a, b) => a < b ? a : b);
    }
  }

  return matrix[s1.length][s2.length];
}


// Function to get the answer with improved matching
String getAnswer(String userQuestion) {
  String? bestMatch;
  int bestDistance = 1000; // Large number for initial comparison

  for (var qa in qaList) {
    int distance = levenshtein(userQuestion.toLowerCase(), qa.question.toLowerCase());
    if (distance < bestDistance) {
      bestDistance = distance;
      bestMatch = qa.answer;
    }
  }

  return bestDistance <= 3 ? bestMatch! : "Sorry, I don't understand the question.";
}

class ChatPage extends StatefulWidget {
  final String initialMessage;
   const ChatPage({super.key, required this.initialMessage});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _messages = [];

  @override
  void initState() {
    super.initState();
    _sendMessage(widget.initialMessage);
  }

  // void _sendMessage([String? userQuestion]) {
  //   //final userQuestion = _controller.text;
  //   final question = userQuestion ?? _controller.text;
  //
  //   if (userQuestion.isNotEmpty) {
  //     final answer = getAnswer(userQuestion);
  //     setState(() {
  //       _messages.add({"question": userQuestion, "answer": answer});
  //       _controller.clear();
  //     });
  //     _scrollToBottom();
  //   }
  // }
  void _sendMessage([String? userQuestion]) {
    final question = userQuestion ?? _controller.text;
    if (question.isNotEmpty) {
      final answer = getAnswer(question);
      setState(() {
        _messages.add({"question": question, "answer": answer});
        _controller.clear();
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.darkGrey,
      appBar: AppBar(
        title: const Text("Chat Support"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end, // Align user question to the left
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                              ),
                            ),
                            child: Text("Q: ${message['question']}",
                              style: const TextStyle(color: CColor.white, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                        ),
                        child: Text("A: ${message['answer']}",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Ask a question...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
