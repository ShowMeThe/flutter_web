// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_web/entity/bing_entity.dart';
import 'package:flutter_web/generated/json/bing_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case BingEntity:
				return bingEntityFromJson(data as BingEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case BingEntity:
				return bingEntityToJson(data as BingEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (BingEntity).toString()){
			return BingEntity().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<BingEntity>[] is M){
			return data.map<BingEntity>((e) => BingEntity().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}