import 'package:arcopen_employee/core/models/message.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/mixins/toast_mixin.dart';
import 'package:arcopen_employee/utils/repositories/chats_repository.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:okito/okito.dart';

class InboxListController extends OkitoController with ToastMixin {
  InboxListController._internal();
  static final InboxListController _singleton = InboxListController._internal();

  factory InboxListController() {
    return _singleton;
  }

  LoadingState loadingState = LoadingState.loading;
  List<Message> messages = [];

  final TextEditingController searchController = TextEditingController();
  final ChatsRepository repository = ChatsRepository();
  void getInboxList() {
    setState(() {
      loadingState = LoadingState.loading;
    });
    repository.allUserChats(userId: Okito.use<AuthService>().user.id).then((value) {
      setState(() {
        loadingState = LoadingState.success;
        messages = value.messages;
      });
    }).catchError((e) {
      setState(() {
        loadingState = LoadingState.failed;
      });
      this.showErrorToast("Failed to load chats. Please try again later.");
    });
  }

  filterData(String value) {
    if (value.isEmpty)
      getInboxList();
    else
      setState(() {
        messages = messages.where((element) {
          return element.message.toLowerCase().contains(value.toLowerCase()) || 
                  element.sentTo.toLowerCase().contains(value.toLowerCase()) ||
                  element.sentBy.toLowerCase().contains(value.toLowerCase()) ||
                  element.time.toLowerCase().contains(value.toLowerCase());
        }).toList();
      });
  }
}
