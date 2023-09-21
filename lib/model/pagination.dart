class Pagination {
  int? prev;
  int? first;
  int? current;
  int? next;
  int? last;
  int? records;
  Pagination({
    required this.prev,
    required this.first,
    required this.current,
    required this.next,
    required this.last,
    required this.records,
  });

  factory Pagination.fromJson(Map<String, Object?> json) {
    return Pagination(
      prev: json["prev"] as int?,
      first: json["first"] as int?,
      current: json["current"] as int?,
      next: json["next"] as int?,
      last: json["last"] as int?,
      records: json["records"] as int?,
    );
  }
}
