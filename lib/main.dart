import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdg_organizers_app/features/notification/logic/notification_cubit.dart';
import 'package:gdg_organizers_app/features/settings/my_event_screen.dart';
import 'package:gdg_organizers_app/shared/widgets/background.dart';
import 'package:gdg_organizers_app/shared/widgets/error_state.dart';

import 'core/theme.dart';
import 'features/auth/auth_screen.dart';
import 'features/auth/bloc/forget_password_bloc.dart';
import 'features/auth/confirm_code.dart';
import 'features/auth/forgetpassword.dart';
import 'features/auth/login_bloc/login_bloc.dart';
import 'features/auth/succes_screen.dart';
import 'features/auth/update_password.dart';
import 'features/events/cubit/event_cubit.dart';
import 'features/events/event_details.dart';
import 'features/home/post_cubit/posts_cubit.dart';
import 'features/nav/app_layout.dart';
import 'features/nav/bloc/cubit.dart';
import 'features/notification/notification_screen.dart';
import 'features/settings/edit_profile_screen.dart';
import 'features/settings/feedback.dart';
import 'features/settings/report_bug.dart';
import 'features/settings/user_bloc/user_bloc.dart';
import 'features/tasks/task_cubit/task_cubit.dart';
import 'logic/auth_bloc/auth_bloc.dart';
import 'logic/imagecubit.dart';
import 'models/user/user.dart';
import 'shared/services/diohelper.dart';
import 'shared/services/notification.dart';
import 'shared/widgets/loading.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp();
  NotificationServices.initializenotification();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthBloc authBloc;
  late UserBloc userBloc;

  @override
  void initState() {
    DioHelper.init();
    authBloc = AuthBloc();
    userBloc = UserBloc(authBloc);
    authBloc.add(const AuthEvent.appstarted());
    super.initState();
  }

  @override
  void dispose() {
    authBloc.close();
    userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => authBloc,
        ),
        BlocProvider(
          create: (context) => LoginBloc(
            authBloc,
          ),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(create: (context) => NotificationCubit()),
        BlocProvider(create: (context) => ImageCubit()),
        BlocProvider(create: (context) => userBloc),
        BlocProvider(create: (context) => EventCubit()),
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => PostsCubit()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'GDG Organizers App',
              routes: {
                EditProfile.routeName: (_) => EditProfile(),
                EventsDetails.routeName: (_) => const EventsDetails(),
                Notifications.routeName: (_) => const Notifications(),
                ConfirmEmail.routeName: (_) => BlocProvider(
                      create: (context) => ForgetPasswordBloc(),
                      child: ConfirmEmail(),
                    ),
                MyEventsScreen.routeName: (_) => BlocProvider(
                      create: (context) => EventCubit(),
                      child: const MyEventsScreen(),
                    ),
                AuthScreen.routeName: (_) => const AuthScreen(),
                ConfirmCode.routeName: (_) => BlocProvider(
                      create: (context) => ForgetPasswordBloc(),
                      child: ConfirmCode(),
                    ),
                FeedbackScreen.routeName: (_) => const FeedbackScreen(),
                UpdatePasswordScreen.routeName: (_) => BlocProvider(
                      create: (context) => ForgetPasswordBloc(),
                      child: const UpdatePasswordScreen(),
                    ),
                ReportScreen.routename: (_) => const ReportScreen(),
                SuccesScreen.routeName: (_) => const SuccesScreen(),
              },
              theme: AppTheme.light(),
              debugShowCheckedModeBanner: false,
              home: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state.when(initial: () {
                    return const SizedBox.shrink();
                  }, loading: () {
                    FlutterNativeSplash.remove();

                    return const Loading();
                  }, authenticated: (User user) {
                    return const LayoutScreen();
                  }, unauthenticated: () {
                    return const AuthScreen();
                  }, failure: (String message) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        authBloc.add(const AuthEvent.appstarted());
                      },
                      child: HomeError(message: message),
                    );
                  });
                },
              ),
            );
          }),
    );
  }
}

class HomeError extends StatelessWidget {
  const HomeError({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return BackGroundImage(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(),
            ErrorState(
              err: message,
              scale: 1,
            ),
          ],
        ),
      ),
    );
  }
}
