class Task {
  final int id;
  final String name;
  final String description;
  final String date;
  final String time;
  final String importance;
  final String dateAdded;
  final String timeAdded;
  final String dateCompleted;
  final int isCompleted;
  final int hasFrequency;

  Task(
      {this.id,
      this.name,
      this.description,
      this.date,
      this.time,
      this.importance,
      this.dateAdded,
      this.timeAdded,
      this.dateCompleted,
      this.isCompleted,
      this.hasFrequency});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'importance': importance,
      'dateAdded': dateAdded,
      'timeAdded': timeAdded,
      'dateCompleted': dateCompleted,
      'isCompleted': isCompleted,
      'hasFrequency': hasFrequency
    };
  }

  @override
  String toString() {
    return '[name: $name, description: $description, date: $date, time: $time]';
  }
}
