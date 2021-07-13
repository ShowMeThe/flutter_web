import 'package:flutter_web/entity/bing_entity.dart';

bingEntityFromJson(BingEntity data, Map<String, dynamic> json) {
	if (json['dateTime'] != null) {
		data.dateTime = json['dateTime'].toString();
	}
	if (json['photoUrl'] != null) {
		data.photoUrl = json['photoUrl'].toString();
	}
	return data;
}

Map<String, dynamic> bingEntityToJson(BingEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateTime'] = entity.dateTime;
	data['photoUrl'] = entity.photoUrl;
	return data;
}