class DataRoutine {
  String? id;
  String? text;
  bool? checkDone;

  DataRoutine({required this.id, required this.text, this.checkDone = false});

  static List<DataRoutine> routineList() {
    return [
      DataRoutine(id: '1', text : "Coffee time and Self Awareness" ,checkDone : true),
      DataRoutine(id: '2', text : "Study With Pomodoro",checkDone: true),
      DataRoutine(id: '3', text : "Read Paper Machine Learning & Deep Learning",),
      DataRoutine(id: '4' ,text : "Exercise HIIT 20 Minute",),
      DataRoutine(id: '5' ,text : "Create MyApp is a  Hobby",),
      DataRoutine(id: '6' ,text : "Meditate 5 minute & podcast" ,),
    ];
  }

}