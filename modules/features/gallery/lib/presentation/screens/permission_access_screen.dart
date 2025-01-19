import 'package:core/router/routes.dart';
import 'package:core/styles/dimen.dart';
import 'package:core/styles/drawable.dart';
import 'package:core/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared/presentation/widgets/widgets.dart';
import 'package:shared/utils/utils.dart' show isStoragePermissionGranted, utils;

class PermissionAccessScreen extends StatefulWidget {
  const PermissionAccessScreen({super.key});

  @override
  State<PermissionAccessScreen> createState() => _PermissionAccessScreenState();
}

class _PermissionAccessScreenState extends State<PermissionAccessScreen> {
  ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: dimen.padding.copyWith(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                drawable.icFolder,
                fit: BoxFit.contain,
                height: 148,
              ),
              const SizedBox(height: 32),
              Text(
                string.of(context).requirePermission,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                string.of(context).requirePermissionDescription,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ValueListenableBuilder(
                  valueListenable: loadingNotifier,
                  builder: (_, isLoading, __) {
                    return Button(
                      label: string.of(context).grantAccess,
                      loading: isLoading,
                      onPressed: () {
                        loadingNotifier.value = true;
                        utils.requestPermission().then((granted) {
                          loadingNotifier.value = false;
                          if (granted) {
                            isStoragePermissionGranted = granted;
                            context.go(Routes.gallery);
                          }
                        });
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
