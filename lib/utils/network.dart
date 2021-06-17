import 'dart:io';
import 'package:logifan/extensions/iterable.dart';

abstract class NetworkUtils {
  static Future<bool> isVpnActive() async {
    var isVpnActive = false;
    List<NetworkInterface> interfaces = await NetworkInterface.list(
      includeLoopback: false,
      type: InternetAddressType.any,
    );
    if (interfaces.isNotEmpty) {
      isVpnActive = interfaces.any((interface) {
        return vpnProtocols.containsSubstring(interface.name);
      });
    }
    return isVpnActive;
  }

  static const vpnProtocols = ['tap', 'tun', 'ppp', 'ipsec', 'utun', 'pptp', 'l2tp', 'ikev2'];
}
