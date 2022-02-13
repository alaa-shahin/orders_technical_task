import 'package:orders_task/themes/light_theme.dart';
import 'package:orders_task/utils/dependency_injection.dart';
import 'package:orders_task/routes/app_pages.dart';

import 'index.dart';

var data;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Fetch content from the json file
  final String response = await rootBundle.loadString('assets/orders.json');
  data = jsonDecode(response);
  addDependency();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String initialRoute = Routes.ORDER;
    return Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) {
        return GetMaterialApp(
          builder: (context, child) {
            return ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 480,
              debugLog: false,
              defaultName: MOBILE,
              defaultScale: true,
              breakpoints: [
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: '4K'),
              ],
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Orders Demo',
          theme: lightTheme,
          initialRoute: initialRoute,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
