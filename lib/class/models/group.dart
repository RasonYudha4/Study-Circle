class Group {
  String? id;
  String invCode;
  String? name;
  String? description;
  String? creator;
  String? newMemberId;
  List<String>? date;
  List<String>? members;
  List<String>? quizzes;

  Group(
      {this.id,
      this.creator,
      required this.invCode,
      this.name,
      this.newMemberId,
      this.date,
      this.description,
      this.members,
      this.quizzes});

  factory Group.fromMap(Map<String, dynamic> data, {String? id}) {
    return Group(
      id: id, // Cast to String? to handle null
      invCode: data['invCode'] as String, // Required field
      name: data['name'] as String?,
      description: data['description'] as String?,
      creator: data['creator'] as String?,
      newMemberId: data['newMemberId'] as String?,
      date: (data['date'] as List<dynamic>?)?.map((e) => e as String).toList(),
      members: (data['members'] as List<dynamic>?)
              ?.map((e) => e != null
                  ? e as String
                  : '') // Check for null and provide a default value
              .toList() ??
          [],
      quizzes:
          (data['quizzes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }

  Group copyWith({
    String? id,
    String? invCode,
    String? name,
    String? creator,
    List<String>? date,
    String? description,
    List<String>? members,
    List<String>? quizzes,
    String? newMemberId,
  }) {
    List<String> updatedMembers = members ?? this.members ?? [];
    if (newMemberId != null && !updatedMembers.contains(newMemberId)) {
      updatedMembers = List.from(updatedMembers)..add(newMemberId);
    }
    return Group(
        id: id ?? this.id,
        invCode: invCode ?? this.invCode,
        name: name ?? this.name,
        creator: creator ?? this.creator,
        date: date ?? this.date,
        description: description ?? this.description,
        members: updatedMembers,
        newMemberId: newMemberId ?? this.newMemberId,
        quizzes: quizzes ?? this.quizzes);
  }
}
