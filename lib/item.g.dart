// GENERATED CODE - DO NOT MODIFY BY HAND

part of item;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      title: (json['title'] as List)?.map((e) => e as String)?.toList(),
      country: (json['country'] as List)?.map((e) => e as String)?.toList(),
      creator: (json['dcCreator'] as List)?.map((e) => e as String)?.toList(),
      description:
          (json['dcDescription'] as List)?.map((e) => e as String)?.toList(),
      preview: (json['edmPreview'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'title': instance.title,
      'country': instance.country,
      'dcCreator': instance.creator,
      'dcDescription': instance.description ,
      'edmPreview': instance.preview
    };
