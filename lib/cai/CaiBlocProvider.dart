import 'package:flutter/material.dart';
import 'package:cai_flutter_demo/blocs/CaiCountBloc.dart';

class CaiBlocProvider extends InheritedWidget {
  final CaiCountBloc bloc = CaiCountBloc();
  CaiBlocProvider({Key key, Widget child}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CaiCountBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CaiBlocProvider) as CaiBlocProvider)
          .bloc;
}
