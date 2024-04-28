part of 'auth_main.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({
    super.key,
    required this.onTapTerms,
    required this.onTapPrivacy,
  });

  final void Function() onTapTerms;
  final void Function() onTapPrivacy;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        style: Get.theme.textTheme.labelSmall!.copyWith(
          color: ColorConstants.black,
        ),
        children: [
          const TextSpan(
            text: 'By logging in or registering, you have agreed to',
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTapTerms,
            text: ' the Terms and Conditions ',
            style: Get.theme.textTheme.labelSmall!.copyWith(
              color: Get.theme.colorScheme.primary,
            ),
          ),
          const TextSpan(text: 'and'),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTapPrivacy,
            text: ' Privacy Policy',
            style: Get.theme.textTheme.labelSmall!.copyWith(
              color: Get.theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
