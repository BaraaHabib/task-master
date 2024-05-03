
part of 'dialogs.dart';

///
Future<dynamic> showErrorDialog(BuildContext context, {
  String? title,
  String? primaryText,
  VoidCallback? primaryButtonCallback,
  String? errorText,
  bool canPop = true,
}) {
  return showAdaptiveDialog<dynamic>(
    barrierDismissible: false,
    context: context,
    builder: (ctx) =>
        ErrorDialog(
          canPop: canPop,
          errorText: errorText,
          title: title,
          primaryButtonCallback: primaryButtonCallback,
          primaryText: primaryText,
        ),
  );
}

/// {@template error_dialog}
/// Dialog to be used when displaying an error dialog
/// {@endtemplate}
class ErrorDialog extends StatelessWidget {

  /// {@macro error_dialog}
  const ErrorDialog({
    super.key,
    this.title,
    this.primaryText,
    this.primaryButtonCallback,
    this.errorText,
    this.canPop = true,
  });

  /// Dialog title
  final String? title;

  /// Text to display on main button
  final String? primaryText;

  /// Action when primary button is pressed
  final VoidCallback? primaryButtonCallback;

  /// Error text
  final String? errorText;

  /// wither dialog can be dismissed or not
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: Center(
          child: IntrinsicHeight(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(dialogsBorderRadius,),
              ),
              child: Column(
                children: [
                  context.lowHeightValue,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title ?? 'Error',
                        style: context
                            .textTheme
                            .titleLarge,
                      ),
                    ],
                  ),
                  if(errorText != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(errorText!),
                      ),
                    ),
                  context.lowHeightValue,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if(primaryText != null && primaryButtonCallback != null)
                        PrimaryButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            primaryButtonCallback!.call();
                          },
                          content: Text(
                            primaryText!,
                            style: context.textTheme.labelLarge,
                          ),
                        ),
                    ],
                  ),
                  context.lowHeightValue,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
