# Running

The project can be launched from the IDE or via command line. You will need the flutter SDK downloaded.

## Get the SDK
- Download the latest flutter SDK and add flutter to your path using `export PATH={flutter SDK path}/bin:$PATH` 
- Switch to the Beta channel by running `flutter channel beta` and selecting the beta option

## Get pub packages
To fetch the latest dependencies run `flutter packages get` in the project directory.

## Build runner
We depend on [build runner](https://pub.dartlang.org/packages/build_runner) to generate our json serialization methods. This will need to run this when we first checkout the porject or after changing a model.

After getting packages run `flutter packages pub run build_runner build` in the project directory. you should see `*.g.dart` files generated as a result.

You can use `flutter packages pub run build_runner watch` during development.

## Running via command line
- Check connected devices with command  `flutter devices`
- Use `flutter run` to launch the app on the default listed device
- Access Dart VM observer from `http://127.0.0.1:8100/`

If any of the above steps fail you can use the `flutter doctor` command to check if there are any dependencies you need to install to complete the setup.

## Running via IntelliJ
- Install the [official Dart plugin for IntelliJ](https://plugins.jetbrains.com/plugin/6351-dart)
- Install the [official Flutter plugin for IntelliJ](https://plugins.jetbrains.com/plugin/9212-flutter)

These plugins provide GUI options for fetching packages, running on devices, debugging and more.

If you're having issues running the app on a simulator use the `flutter doctor` command to check if there are any dependencies you need to install to complete the setup.