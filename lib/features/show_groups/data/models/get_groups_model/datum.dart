import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final String? groupName;
  final int? ownerId;
  final String? owner;
  final int? membersCount;

  const Datum({
    this.id,
    this.groupName,
    this.ownerId,
    this.owner,
    this.membersCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        groupName: json['group_name'] as String?,
        ownerId: json['owner_id'] as int?,
        owner: json['owner'] as String?,
        membersCount: json['members_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'group_name': groupName,
        'owner_id': ownerId,
        'owner': owner,
        'members_count': membersCount,
      };

  @override
  List<Object?> get props {
    return [
      id,
      groupName,
      ownerId,
      owner,
      membersCount,
    ];
  }
}
