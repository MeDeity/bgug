import 'package:flame_gamepad/flame_gamepad.dart';
///是否显示教程内容
enum TutorialStatus {
  NOT_SHOWING,
  PAGE_0_REGULAR,
  PAGE_0_GAMEPAD,
  PAGE_1
}

Future<TutorialStatus> getFirstTutorialStatus() async {//状态0选择,如果有使用到手柄的话
  bool gamepad = await FlameGamepad.isGamepadConnected;
  return gamepad ? TutorialStatus.PAGE_0_GAMEPAD : TutorialStatus.PAGE_0_REGULAR;
}

TutorialStatus getNextStatus(TutorialStatus current) {///下一个状态（没有下一页的话则关闭教程显示）
  if (current == TutorialStatus.PAGE_0_GAMEPAD || current == TutorialStatus.PAGE_0_REGULAR) {
    return TutorialStatus.PAGE_1;
  } else {
    return TutorialStatus.NOT_SHOWING;
  }
}