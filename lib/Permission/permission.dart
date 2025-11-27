import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  late Map<Permission,PermissionStatus> status;

  Future<bool> init() async {
    var stat = await Permission.locationWhenInUse.request();
    if(stat.isPermanentlyDenied){
      await openAppSettings();
    }
    else if(stat.isDenied){
      var newStat = await Permission.locationWhenInUse.request();
      if(newStat.isGranted){
        return false;
      }
      else if(stat.isPermanentlyDenied){
        await openAppSettings();
      }
    }
    else if(stat.isGranted){
      return true;
    }

    return false;
  }
}
