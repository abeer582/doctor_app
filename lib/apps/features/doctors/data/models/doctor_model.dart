class Doctor {
  final String name;
  final String speciality;
  final String clinic;
  final double rating;
  final int experienceYears;
  final int satisfaction;
  final int patientStories;
  final double pricePerHour;
  final String nextAvailable;
  bool isFavorite;

  Doctor({
     required this.name,
     required this.speciality,
    this.clinic = 'Upasana Dental Clinic, salt lake',
    required this.rating ,
    this.experienceYears = 7,
    this.satisfaction = 87,
    this.patientStories = 69,
    this.pricePerHour = 28.0,
    this.nextAvailable = '10:00 AM tomorrow',
    this.isFavorite = false,
  });
}

final List<Doctor> dummyDoctors = [
  Doctor(
    name: 'Dr. Shruti Kedia',
    speciality: 'Tooths Dentist',
    experienceYears: 7,
    satisfaction: 87,
    patientStories: 69,
    isFavorite: true,
    rating: 4
  ),
  Doctor(
    name: 'Dr. Watamaniuk',
    speciality: 'Tooths Dentist',
    experienceYears: 9,
    satisfaction: 74,
    patientStories: 78,
    nextAvailable: '12:00 AM tomorrow',
    rating: 5
  ),
  Doctor(
    name: 'Dr. Crownover',
    speciality: 'Tooths Dentist',
    experienceYears: 5,
    satisfaction: 59,
    patientStories: 86,
    nextAvailable: '11:00 AM tomorrow',
    isFavorite: true,
    rating: 2
  ),
  Doctor(
    name: 'Dr. Balester',
    speciality: 'Tooths Dentist',
    experienceYears: 6,
    satisfaction: 91,
    patientStories: 55,
    rating: 2.5
  ),
];