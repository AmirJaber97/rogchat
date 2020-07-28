import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/enums/notifier_state.dart';
import 'package:skype_clone/ui/setup/failure_model.dart';

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          print('Print Fail object $obj');
          return obj as Failure;
        } catch (e) {
          print(e);
          throw obj;
        }
      }),
    );
  }
}

class BaseModel extends ChangeNotifier {
  NotifierState _state = NotifierState.Initial;

  NotifierState get state => _state;

  void setNotifier(NotifierState state) {
    _state = state;
    notifyListeners();
  }
}
