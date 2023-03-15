import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  SharedPrefController._();

  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> isLogin({required bool isLogin}) async {
    await _sharedPreferences.setBool("isLogin", isLogin);
  }

  bool? get boarding {
    return _sharedPreferences.getBool("isLogin") ?? false;
  }

  Future<void> saveCoordinate(
      {required double long, required double lat}) async {
    await _sharedPreferences.setDouble("long", long);
    await _sharedPreferences.setDouble("lat", lat);
  }

  Future<void> saveStatus1({required bool status1}) async {
    await _sharedPreferences.setBool("status1", status1);
  }

  Future<void> saveStatus2({required bool status2}) async {
    await _sharedPreferences.setBool("status2", status2);
  }

  Future<void> saveStatus3({required bool status3}) async {
    await _sharedPreferences.setBool("status3", status3);
  }

  Future<void> saveStatus4({required bool status4}) async {
    await _sharedPreferences.setBool("status4", status4);
  }

  Future<void> saveStatus5({required bool status5}) async {
    await _sharedPreferences.setBool("status5", status5);
  }

  Future<void> saveStatus6({required int status6}) async {
    await _sharedPreferences.setInt("status6", status6);
  }

  double? get longitude {
    return _sharedPreferences.getDouble("long");
  }

  double? get latitude {
    return _sharedPreferences.getDouble("lat");
  }

  bool? get status1 {
    return _sharedPreferences.getBool("status1");
  }

  bool? get status2 {
    return _sharedPreferences.getBool("status2");
  }

  bool? get status3 {
    return _sharedPreferences.getBool("status3");
  }

  bool? get status4 {
    return _sharedPreferences.getBool("status4");
  }

  bool? get status5 {
    return _sharedPreferences.getBool("status5");
  }

  int? get status6 {
    return _sharedPreferences.getInt("status6");
  }

  //////////////////////////////////////////////////////////////////////////////
  Future<void> fajr(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour1", hour);
    await _sharedPreferences.setInt("minute1", minute);
    await _sharedPreferences.setString("fajr", prayTime);
  }

  Future<void> shrouq({required String prayTime}) async {
    await _sharedPreferences.setString("shrouq", prayTime);
  }

  Future<void> dhur(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour2", hour);
    await _sharedPreferences.setInt("minute2", minute);
    await _sharedPreferences.setString("dhur", prayTime);
  }

  Future<void> asr(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour3", hour);
    await _sharedPreferences.setInt("minute3", minute);
    await _sharedPreferences.setString("asr", prayTime);
  }

  Future<void> magrab(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour4", hour);
    await _sharedPreferences.setInt("minute4", minute);
    await _sharedPreferences.setString("magrab", prayTime);
  }

  Future<void> isha(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour5", hour);
    await _sharedPreferences.setInt("minute5", minute);
    await _sharedPreferences.setString("isha", prayTime);
  }

  Future<void> saveQuran({required String name}) async {
    await _sharedPreferences.setString("name", name);
  }

  Future<void> savePage({required int index}) async {
    await _sharedPreferences.setInt("index", index);
  }

  Future<void> saveSurah({required int index}) async {
    await _sharedPreferences.setInt("number", index);
  }

  int? get currentSurah {
    return _sharedPreferences.getInt("number");
  }

  int? get currentPage {
    return _sharedPreferences.getInt("index");
  }

  String? get nameQuran {
    return _sharedPreferences.getString("name");
  }

  int? get fajrHour {
    return _sharedPreferences.getInt("hour1");
  }

  int? get fajrMinute {
    return _sharedPreferences.getInt("minute1");
  }

  int? get dhurHour {
    return _sharedPreferences.getInt("hour2");
  }

  int? get dhurMinute {
    return _sharedPreferences.getInt("minute2");
  }

  int? get asrHour {
    return _sharedPreferences.getInt("hour3");
  }

  int? get asrMinute {
    return _sharedPreferences.getInt("minute3");
  }

  int? get magrabHour {
    return _sharedPreferences.getInt("hour4");
  }

  int? get magrabMinute {
    return _sharedPreferences.getInt("minute4");
  }

  int? get ishaHour {
    return _sharedPreferences.getInt("hour5");
  }

  int? get ishaMinute {
    return _sharedPreferences.getInt("minute5");
  }

  String? get prayFajr {
    return _sharedPreferences.getString("fajr");
  }

  String? get prayDhar {
    return _sharedPreferences.getString("dhur");
  }

  String? get prayAsr {
    return _sharedPreferences.getString("asr");
  }

  String? get prayMagrib {
    return _sharedPreferences.getString("magrab");
  }

  String? get prayIsha {
    return _sharedPreferences.getString("isha");
  }

  String? get prayShrouq {
    return _sharedPreferences.getString("shrouq");
  }
}
