class HadithModel{
  final int id;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int sectionId;
  final String hadithKey;
  final String hadithId;
  final String narrator;
  final String bn;
  final String ar;
  final String arDiacless;
  final String note;
  final int gradeId;
  final String grade;
  final String gradeColor;

  HadithModel({
    required this.id,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.hadithKey,
    required this.hadithId,
    required this.narrator,
    required this.bn,
    required this.ar,
    required this.arDiacless,
    required this.note,
    required this.gradeId,
    required this.grade,
    required this.gradeColor
  });

  factory HadithModel.fromMap(Map<String, dynamic> map) {
    return HadithModel(
      id: map['id'] as int? ?? 0,
      bookId: map['book_id'] as int? ?? 0,
      bookName: map['book_name'] as String? ?? '',
      chapterId: map['chapter_id'] as int? ?? 0,
      sectionId: map['section_id'] as int? ?? 0,
      hadithKey: map['hadith_key'] as String? ?? '',
      hadithId: map['hadith_id'].toString(),
      narrator: map['narrator'] as String? ?? '',
      bn: map['bn'] as String? ?? '',
      ar: map['ar'] as String? ?? '',
      arDiacless: map['ar_diacless'] as String? ?? '',
      note: map['note'] as String? ?? '',
      gradeId: map['grade_id'] as int? ?? 0,
      grade: map['grade'] as String? ?? '',
      gradeColor: map['grade_color'] as String? ?? '',
    );
  }

}