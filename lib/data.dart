class Exercise {
  String title;
  String level;
  String equipment;
  String category;
  int duration;
  String imageUrl;

  Exercise(
    this.title,
    this.level,
    this.equipment,
    this.category,
    this.duration,
    this.imageUrl,
  );
}

List<Exercise> exercises = [
  Exercise(
    "Strong and Big Chest",
    "Advanced Level",
    "Full Equipment",
    "Strength",
    45,
    'https://wallpaperplay.com/walls/full/3/5/c/32728.jpg',
  ),
  Exercise(
    "Back Workout",
    "Beginner Level",
    "Full Equipment",
    "Strength",
    55,
    'https://c4.wallpaperflare.com/wallpaper/150/221/189/man-back-workout-bodybuilding-wallpaper-preview.jpg',
  ),
  Exercise(
    "The Total Attack",
    "Advanced Level",
    "Basic Equipment",
    "Endurance",
    45,
    'https://wallpaperplay.com/walls/full/6/1/7/32744.jpg',
  ),
];

List<String> trainers = ['Robert\nBlazevic', 'Jeff\nShid', 'Kris\nGethin'];
