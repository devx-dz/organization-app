import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/shared/widgets/custom_app_bar.dart';
import 'package:iconly/iconly.dart';

import '../../core/const.dart';
import '../../core/extention.dart';
import '../../shared/widgets/background.dart';
import '../../shared/widgets/custom_image.dart';
import '../../shared/widgets/loading.dart';
import '../settings/user_bloc/user_bloc.dart';
import '../settings/widgets/custom_button.dart';
import 'models/event.dart';

part 'widgets/app_bar.dart';
part 'widgets/event_button.dart';
part 'widgets/header.dart';

class EventsDetails extends StatelessWidget {
  static const String routeName = '/eventsDetails';

  const EventsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as Event;

    return Stack(
      children: [
        BackGroundImage(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: const CustomBackButton(),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  EventDetailsAppBar(event: event),
                  Header(event: event),
                  //   if (event.state == 'Registraion')
                  EventButton(
                    id: event.id,
                  )
                ],
              ),
            ),
          ),
        ),
        BlocBuilder<UserBloc, UserState>(
            builder: (context, state) => state.maybeMap(
                orElse: () => const SizedBox.shrink(),
                loading: (value) => Loading(
                      color: Colors.black.withOpacity(0.4),
                    )))
      ],
    );
  }
}
