import 'package:mobx/mobx.dart';

part 'detail_controller.g.dart';

class DetailController = _DetailBase with _$DetailController;

abstract class _DetailBase with Store {
  _DetailBase() {
    _init();
  }

  _init() {}
}
