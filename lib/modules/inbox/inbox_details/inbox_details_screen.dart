import 'package:arcopen_employee/core/models/message.dart';
import 'package:arcopen_employee/modules/inbox/inbox_details/inbox_details_controller.dart';
import 'package:arcopen_employee/utils/helpers/asset_helper.dart';
import 'package:arcopen_employee/utils/helpers/loading_state.dart';
import 'package:arcopen_employee/utils/services/auth_service.dart';
import 'package:arcopen_employee/widgets/states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:okito/okito.dart';
import 'package:arcopen_employee/config/routes/k_router.dart';
import 'package:arcopen_employee/constants/color_constants.dart';
import 'package:arcopen_employee/widgets/buttons/k_button.dart';
import 'package:arcopen_employee/widgets/misc/section_title.dart';

class InboxDetailsScreen extends StatefulWidget {
  const InboxDetailsScreen({Key? key}) : super(key: key);

  @override
  _InboxDetailsScreenState createState() => _InboxDetailsScreenState();
}

class _InboxDetailsScreenState extends State<InboxDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      InboxDetailsController.shared.loadChats();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: OkitoBuilder(
            controller: InboxDetailsController.shared,
            builder: () {
              Widget pageContent = const SizedBox();

              Widget pageStateContainer(Widget child) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      child,
                    ],
                  ),
                );
              }

              switch (InboxDetailsController.shared.state) {
                case LoadingState.failed:
                  pageContent = pageStateContainer(
                    KButton(
                      onPressed: InboxDetailsController.shared.loadChats,
                      title: "Try again",
                      color: Okito.theme.primaryColor,
                    ),
                  );
                  break;
                case LoadingState.loading:
                  pageContent = pageStateContainer(
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                  break;
                case LoadingState.success:
                  pageContent = InboxDetailsController.shared.messages.isEmpty
                      ? pageStateContainer(EmptyState(
                          stateType: StateType.message,
                        ))
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...InboxDetailsController.shared.messages.map((message) {
                                    final service = Okito.use<AuthService>();
                                    bool authUserIsSender = service.user.name == message.sender;

                                    return Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: SectionTitle(
                                            title: message.messageTime,
                                            textColor: Colors.black,
                                          ),
                                        ),
                                        _MessageBulb(
                                          message: message.message,
                                          alignment: authUserIsSender ? BulbAlignment.right : BulbAlignment.left,
                                        ),
                                      ],
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        );
                  break;
                case LoadingState.pending:
                  pageContent = const SizedBox();
                  break;
              }
              final Message message = Okito.arguments["message"];
              late ImageProvider userProfilePicture;

              if (message.profilePic.isNotEmpty) {
                userProfilePicture = NetworkImage(AssetHelper().getEmployerProfilePic(name: message.profilePic));
              } else {
                userProfilePicture = AssetImage(AssetHelper().getAsset(name: "avatar.png"));
              }
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            PhosphorIcons.caret_left,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            KRouter().pop();
                          },
                        ),
                        CircleAvatar(
                          backgroundImage: userProfilePicture,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                InboxDetailsController.shared.receiver,
                                style: Okito.theme.textTheme.bodyText2!.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  const _Line(),
                  pageContent,
                ],
              );
            },
          ),
        ),
      ),
      backgroundColor: const Color(0XFFF5F7FD),
    );
  }
}

class _MessageBulb extends StatelessWidget {
  const _MessageBulb({
    Key? key,
    this.alignment = BulbAlignment.right,
    required this.message,
  }) : super(key: key);

  final BulbAlignment alignment;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment == BulbAlignment.left ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        padding: const EdgeInsets.all(12.0),
        margin: EdgeInsets.symmetric(vertical: 6.0),
        decoration: BoxDecoration(
          color: alignment == BulbAlignment.left ? Color(0XFFF5F5F5) : Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 2.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Text(
          "$message",
          style: Okito.theme.textTheme.bodyText2!.copyWith(fontSize: 14.0),
        ),
      ),
    );
  }
}

enum BulbAlignment { left, right }

class _Line extends StatelessWidget {
  const _Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      decoration: BoxDecoration(
        color: ColorConstants.greyColor.withOpacity(0.5),
      ),
    );
  }
}
