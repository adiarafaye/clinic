import 'package:flutter_session_manager/flutter_session_manager.dart';

var session = SessionManager();
void setUserId(int userId) async {
  await session.set('user_id', userId);
}

getUserId() async {
  int userId = await session.get('user_id');
  return userId;
}

void setUserProfile(String userProfile) async {
  await session.set('user_profile', userProfile);
}

getUserProfile() async {
  String userProfile = await session.get('user_Profile');
  return userProfile;
}

void setAdminId(int idadmin) async {
  await session.set('idadmin', idadmin);
}

getAdminId() async {
  int idadmin = await session.get('idadmin');
  return idadmin;
}

void setMedecinId(int idmedecin) async {
  await session.set('idmedecin', idmedecin);
}

getMedecinId() async {
  int idmedecin = await session.get('idmedecin');
  return idmedecin;
}
