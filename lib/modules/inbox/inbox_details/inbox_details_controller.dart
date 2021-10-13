import 'package:arcopen_employee/core/models/chat.dart';
import 'package:arcopen_employee/core/models/message.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/chats_repository.dart';
import 'package:okito/okito.dart';

class InboxDetailsController extends OkitoController with ToastMixin {
  static final InboxDetailsController shared = InboxDetailsController();
  final ChatsRepository repository = ChatsRepository();

  bool canSendMessages = false;
  List<Chat> messages = [];

  LoadingState state = LoadingState.loading;

  String get receiver => messages.isNotEmpty ? messages.first.receiver : "Unknown";

  void loadChats() {
    final Message message = Okito.arguments["message"];
    setState(() {
      state = LoadingState.loading;
    });
    repository.chatMessages(userId: message.sentById, sentToId: message.sentToId.toString()).then((value) {
      setState(() {
        state = LoadingState.success;
        messages = value.messages;
        canSendMessages = value.canSendMessage;
      });
    }).catchError((e) {
      setState(() {
        state = LoadingState.failed;
      });
      this.showErrorToast("Failed to load chats. Please try again later.");
    });
  }
}
