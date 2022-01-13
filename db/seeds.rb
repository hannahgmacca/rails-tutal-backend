# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
subjects = [
	'Language Arts',
	'Mathematics',
	'Science',
	'Health',
	'Handwriting',
	'Physical Education (P.E.)',
	'Art',
	'Music',
	'Instrumental Music – specific instrument',
	'Movement or Eurythmy',
	'Handwork or handcrafts',
	'Life Lab or gardening',
	'Dramatics',
	'Dance',
	'Spanish or other foreign language',
	'Leadership',
	'Special Education Day Class',
	'Resource Program',
	'Speech',
	'Adaptive P.E.',
	'Occupational Therapy',
	'Reading',
	'Language arts',
	'Speech and Debate',
	'English',
	'Basic Math',
	'Pre-algebra',
	'Consumer Math',
	'Algebra',
	'Geometry',
	'Honors Math in Algebra or Geometry',
	'Life Science',
	'Earth Science',
	'Physical Science',
	'Health',
	'Social Studies',
	'Geography',
	'Ancient Civilizations',
	'English I',
	'English II',
	'English III',
	'English IV',
	'Remedial English',
	'ESL – English as second language',

	'World Literature',

	'Ancient Literature',

	'Medieval Literature',

	'Renaissance Literature',

	'Modern Literature',

	'British Literature',

	'American Literature',

	'{Short Story}',

	'{Classical literature}',

	'{Shakespeare}',

	'{Heroes, Myth and Legend}',

	'{Film as Literature}',

	'Composition',
	'Creative Writing',

	'Poetry',

	'Grammar',

	'Vocabulary',

	'Debate',

	'Speech',

	'Journalism',

	'Publishing Skills',

	'Photojournalism',

	'Yearbook',

	'Study Skills',

	'Research Skills',
	'Art I',

	'Art II',

	'Art III',

	'Art IV',

	'Art Appreciation',

	'Art History',

	'Drawing',

	'Painting',

	'Sculpture',

	'Ceramics',

	'Pottery',

	'Instrumental Music',

	'Music Appreciation',

	'Music History',

	'Music Theory',

	'Music Fundamentals',

	'Band',

	'Orchestra',

	'Choir',

	'Voice',

	'Classical Music Studies',

	'Performing Arts',

	'Theatre Arts -{Beg., interm., and advanced}',

	'{Improvisational Theater}',

	'Dance',
	'Computer Aided Design {Digital Media}',

	'Photography',

	'{Videography}',

	'{History of Film}',

	'{Film Production}',
	'Leather Working',

	'Drafting',

	'Metal Work',

	'Small Engine Mechanics',

	'General Science',

	'Physics',

	'Physical Science',

	'Chemistry',

	'Organic Chemistry',

	'Life Science',

	'Biology',

	'Zoology',

	'Marine Biology',

	'Botany',

	'Earth Science',

	'Geology',

	'Oceanography',

	'Meteorology',

	'Astronomy',

	'Animal Science',

	'Equine Science',

	'Veterinary Science',

	'Forensic Science',

	'Ecology',

	'Environmental Science',

	'Spanish',

	'French',

	'Japanese',

	'German',

	'Latin',

	'Greek',

	'Hebrew',

	'Chinese',

	'{Conversational} LANGUAGE',

	'(LANGUAGE) Literature',

	'(LANGUAGE) Culture',

	'(LANGUAGE) History',

	'Sign Language',

	'Remedial Math',

	'Fundamental Math or Basic Math',

	'Mathematics',

	'Pre-Algebra',

	'Introduction to Algebra',

	'Algebra',

	'Algebra I',

	'Algebra II',

	'Intermediate Algebra',

	'Geometry',

	'Trigonometry',

	'Precalculus',

	'Calculus',

	'Statistics',

	'Business Math',

	'Consumer Math',

	'Ancient History',

	'Medieval History',

	'Greek and Roman History',

	'Renaissance History with US History',

	'Modern History with US History',

	'World History',

	'History of (——-)',

	'World Geography',

	'US History',

	'World Religions',

	'World Current Events {Global Issues}',

	'Government',

	'Civics',

	'Economics',

	'Political Science',

	'Social Sciences',

	'Psychology',

	'Sociology',

	'Anthropology',

	'Genealogy',

	'Philosophy',

	'LOGIC',

	'Logic I',

	'Logic II',

	'Health',

	'Basic First Aid and Safety',

	'Nutrition',

	'Healthful Living {Personal Health}',

	'Team Sports (Soccer, volleyball, football, etc)',

	'Gymnastics',

	'Track and Field',

	'Archery',

	'Fencing',

	'Golf',

	'Rock Climbing',

	'Outdoor Survival Skills',

	'Hiking',

	'Equestrian Skills',

	'Weightlifting',

	'Physical Fitness',

	'Aerobics',

	'Yoga',

	'Martial Arts',

	'Ice Skating',

	'Figure skating',

	'Cycling',

	'Bowling',

	'Drill Team, Honor Guard, Pageantry, Flag, Cheer',

	'Adapted P.E',

	'COMPUTERS',

	'Keyboarding',

	'Word Processing',

	'Computer Aided Drafting',

	'Computer Applications:',

	'Computer Graphics',

	'Digital Arts',

	'Photoshop',

	'Programming',

	'Computer Repair',

	'Web Design',

	'Desktop Publishing',

	'Culinary Arts',

	'Child Development',

	'Home Management',

	'Home Organization',

	'Basic Yard Care',

	'Financial Management',

	'Driver’s Education',

	'Personal Organization',

	'Social Skills',

	'AP Courses in any core subject',

	'Honors Courses in any core subject',

	'Study Skills',

	'SAT Prep',

	'Work-Study',

	'Career Planning',

	'Critical Thinking',
	'Rhetoric',
	'Accounting',
	'Personal Finance and Investing',
	'Gardening',
	'Food Science',
	'Auto Mechanics',
	'Medieval and Renaissance',
	'U.S. History and Government',
	'French / Spanish / Latin',
	'Art',
	'Home Economics',
	'Woodshop',
	'Metal Shop',
	'Business Technology',
	'Instrumental Music',
	'Band',
	'Choir',
	'Drama',
	'Physical Education',
	'Sports',
	'Special Education Day Class',
	'Resource Program',
	'Speech Therapy',
	'Occupational Therapy',
];

subjects.each do |subject|
	Subject.create(label: subject)
end

# Subject.create(label: 'Maths')
# Subject.create(label: 'Science')
# Subject.create(label: 'English')
# Subject.create(label: 'PE')
# Subject.create(label: 'Chemistry')
# Subject.create(label: 'Biology')

User.create(email: "dan@ymail.com", password: "pword", password_confirmation: "pword")
User.create(email: "han@ymail.com", password: "pword", password_confirmation: "pword")
User.create(email: "admin@ymail.com", password: "pword", password_confirmation: "pword")
User.create(email: "student@ymail.com", password: "pword", password_confirmation: "pword")
User.create(email: "student2@ymail.com", password: "pword", password_confirmation: "pword")


UserInfo.create(first_name: "Danny", last_name: "Jones", about: "Tutor", postcode: 2000, user_id: 1)
UserInfo.create(first_name: "Hannah", last_name: "McDonald", about: "Tutor", postcode: 2005, user_id: 2)
UserInfo.create(first_name: "Admin", last_name: "User", about: "Practice admin - need to add admin to user table", postcode: 3000, user_id: 3)
UserInfo.create(first_name: "Grace", last_name: "Singh", about: "Practice student", postcode: 3000, user_id: 4)
UserInfo.create(first_name: "Rose", last_name: "Fig", about: "Practice student", postcode: 3001, user_id: 5)

Student.create(user_info_id: 4)
Student.create(user_info_id: 5)
StudentSubject.create(student_id: 1, subject_id: 1)
StudentSubject.create(student_id: 1, subject_id: 2)
StudentSubject.create(student_id: 1, subject_id: 3)
StudentSubject.create(student_id: 2, subject_id: 1)
StudentSubject.create(student_id: 2, subject_id: 2)
StudentSubject.create(student_id: 2, subject_id: 3)

Tutor.create(user_info_id: 1, rating: 4, rate: 15, years_experience: 5, online: true)
Tutor.create(user_info_id: 2, rating: 4, rate: 20, years_experience: 15, online: false)
TutorSubject.create(tutor_id: 1, subject_id: 1)
TutorSubject.create(tutor_id: 1, subject_id: 2)
TutorSubject.create(tutor_id: 1, subject_id: 3)
TutorSubject.create(tutor_id: 2, subject_id: 1)
TutorSubject.create(tutor_id: 2, subject_id: 2)
TutorSubject.create(tutor_id: 2, subject_id: 3)

Request.create(student_id: 1, tutor_id: 1, is_approved: false)
Request.create(student_id: 1, tutor_id: 2, is_approved: false)
Request.create(student_id: 2, tutor_id: 1, is_approved: true)
Request.create(student_id: 2, tutor_id: 2, is_approved: false)

TutorStudent.create(student_id: 1, tutor_id: 1, review: "Great service", rating: 5)
TutorStudent.create(student_id: 2, tutor_id: 1, review: "Terrible tutor, would never go back", rating: 1)


