part of '../auth_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            minimumSize: MaterialStateProperty.all(
              Size(ScreenUtil().setWidth(300), ScreenUtil().setHeight(60)),
            ),
          ),
      onPressed: onPressed,
      child: Text(
        'Countinue',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

class Authpic extends StatelessWidget {
  const Authpic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        AuthBanner(
          image: 'Group_3_.png',
          title: 'GDG Algiers',
        ),
        Spacer(),
        AuthBanner(
          image: 'Group.png',
          title: 'Women Techmakers \n Algiers',
        ),
      ],
    );
  }
}

class AuthBanner extends StatelessWidget {
  const AuthBanner({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('$images/$image'),
        const SizedBox(width: 10),
        Text(title,
            style: const TextStyle(
                fontSize: 12,
                color: kTextLightColor,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}

class AuthAnimation extends StatefulWidget {
  const AuthAnimation({
    super.key,
    required this.duration,
    required this.begin,
    required this.end,
    required this.child,
    required this.curve,
    required this.repeat,
  });
  final Duration duration;
  final Offset begin;
  final Offset end;
  final Curve curve;
  final Widget? child;
  final bool repeat;

  @override
  State<AuthAnimation> createState() => _AuthAnimationState();
}

class _AuthAnimationState extends State<AuthAnimation>
    with SingleTickerProviderStateMixin {
  void repeatOnce() async {
    await _firstcontroller.forward();
  }

  late final AnimationController _firstcontroller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat(reverse: widget.repeat);
  late final Animation<Offset> _animation = Tween<Offset>(
    begin: widget.begin,
    end: widget.end,
  ).animate(CurvedAnimation(
    parent: _firstcontroller,
    curve: widget.curve,
  ));
  @override
  void initState() {
    if (!widget.repeat) repeatOnce();

    super.initState();
  }

  @override
  void dispose() {
    _firstcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
