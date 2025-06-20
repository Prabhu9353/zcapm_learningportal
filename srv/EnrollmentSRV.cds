using { db as Student } from '../db/Enrollment';

service LaerningPortal {
entity MentorSet as projection on Student.Mentor;
entity CourseSet  as projection on Student.Course;
entity TraineeSet as projection on Student.Trainee;
}

