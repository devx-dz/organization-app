part of '../event_details.dart';

class EventButton extends StatelessWidget {
  const EventButton({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(350.w, 55.h)),
        onPressed: () {
          showDialog(
              context: context, builder: (context) => EventPopUP(id: id));
        },
        child: const Text('Join as Organizer'));
  }
}

class EventPopUP extends StatefulWidget {
  const EventPopUP({super.key, required this.id});
  final String id;

  @override
  State<EventPopUP> createState() => _EventPopUPState();
}

class _EventPopUPState extends State<EventPopUP> {
  late TextEditingController _textEditingController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kLightGrey,
      title: Text(
        'Join as organizer : ',
        style:
            context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 360.h,
        width: 350.w,
        child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2,
                        spreadRadius: 0,
                        offset: const Offset(0, 2))
                  ]),
              child: TextFormField(
                controller: _textEditingController,
                maxLines: 10,
                autocorrect: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 12, color: Colors.black),
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Show your motivation ',
                    hintStyle:
                        TextStyle(fontSize: 12, color: Color(0xff847E7E))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    title: 'Cancel',
                    color: Colors.white,
                    onTap: () {
                      context.pop();
                    },
                    size: Size(135.w, 32.h),
                    textStyle: context.textTheme.labelMedium!
                        .copyWith(color: Colors.red),
                    border: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        side: BorderSide(color: Colors.red, width: 1))),
                CustomButton(
                  title: 'Submit',
                  size: Size(135.w, 32.h),
                  color: kGreen,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<UserBloc>().add(UserEvent.submiteOrganizer(
                          widget.id, _textEditingController.text));
                      context.pop();
                    }
                  },
                  textStyle: context.textTheme.labelMedium!
                      .copyWith(color: Colors.white),
                  border: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
