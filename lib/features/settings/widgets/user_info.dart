import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/core/const.dart';

import '../../../logic/auth_bloc/auth_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            '${context.watch<AuthBloc>().user.lastname} ${context.watch<AuthBloc>().user.firstname}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text('Member',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: kBlue)),
        ],
      ),
    );
  }
}
