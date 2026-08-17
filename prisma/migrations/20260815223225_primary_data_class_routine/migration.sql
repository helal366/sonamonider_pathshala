-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE', 'OTHER');

-- CreateEnum
CREATE TYPE "BloodGroup" AS ENUM ('A_POSITIVE', 'A_NEGATIVE', 'B_POSITIVE', 'B_NEGATIVE', 'AB_POSITIVE', 'AB_NEGATIVE', 'O_POSITIVE', 'O_NEGATIVE');

-- CreateEnum
CREATE TYPE "Religion" AS ENUM ('ISLAM', 'HINDU', 'CHRISTIAN', 'BUDDO', 'OTHER');

-- CreateEnum
CREATE TYPE "Morning_Section" AS ENUM ('madrashatul_atfal', 'sonamonider_pathshala');

-- CreateEnum
CREATE TYPE "WeekDays" AS ENUM ('SATURDAY', 'SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY');

-- CreateEnum
CREATE TYPE "Months" AS ENUM ('JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER');

-- CreateEnum
CREATE TYPE "ActiveStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "AuditAction" AS ENUM ('CREATE', 'UPDATE', 'DELETE');

-- CreateEnum
CREATE TYPE "EducationDegree" AS ENUM ('SSC', 'HSC', 'BSC', 'B_COM', 'B_ARTS', 'MSC', 'M_COM', 'M_ARTS', 'PHD', 'ALIM', 'DAKHIL', 'KAMIL', 'FAZIL', 'OTHERS');

-- CreateTable
CREATE TABLE "academic_results" (
    "academic_result_id" TEXT NOT NULL,
    "ssc_result" TEXT,
    "dakhil_result" TEXT,
    "hsc_result" TEXT,
    "alim_result" TEXT,
    "hons_result" TEXT,
    "fazil_result" TEXT,
    "masters_result" TEXT,
    "kamil" TEXT,
    "teacher_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "academic_results_pkey" PRIMARY KEY ("academic_result_id")
);

-- CreateTable
CREATE TABLE "permanent_addresses" (
    "permanent_address_id" TEXT NOT NULL,
    "house_no" TEXT,
    "house_name" TEXT,
    "plot_no" TEXT,
    "road_no" TEXT,
    "neighbourhood" TEXT,
    "region" TEXT,
    "village" TEXT,
    "post_code" INTEGER,
    "post_office" TEXT,
    "thana" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "country" TEXT NOT NULL DEFAULT 'Bangladesh',
    "user_id" TEXT,
    "spouse_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "permanent_addresses_pkey" PRIMARY KEY ("permanent_address_id")
);

-- CreateTable
CREATE TABLE "present_addresses" (
    "present_address_id" TEXT NOT NULL,
    "house_no" TEXT,
    "house_name" TEXT,
    "plot_no" TEXT,
    "road_no" TEXT,
    "neighbourhood" TEXT,
    "region" TEXT,
    "village" TEXT,
    "post_code" INTEGER,
    "post_office" TEXT,
    "thana" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "country" TEXT NOT NULL DEFAULT 'Bangladesh',
    "user_id" TEXT,
    "spouse_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "present_addresses_pkey" PRIMARY KEY ("present_address_id")
);

-- CreateTable
CREATE TABLE "spouse_infromation" (
    "spouse_id" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "contact_no" TEXT,
    "father_name" TEXT,
    "father_contact_no" TEXT,
    "mother_name" TEXT,
    "mother_contact_no" TEXT,
    "occupation" TEXT,
    "job_title" TEXT,
    "monthly_income" INTEGER,
    "teacher_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "spouse_infromation_pkey" PRIMARY KEY ("spouse_id")
);

-- CreateTable
CREATE TABLE "institute_addresses" (
    "institute_address_id" TEXT NOT NULL,
    "house_no" TEXT,
    "house_name" TEXT,
    "plot_no" TEXT,
    "road_no" TEXT,
    "neighbourhood" TEXT,
    "region" TEXT,
    "village" TEXT,
    "post_code" INTEGER,
    "post_office" TEXT,
    "thana" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "country" TEXT NOT NULL DEFAULT 'Bangladesh',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "institute_addresses_pkey" PRIMARY KEY ("institute_address_id")
);

-- CreateTable
CREATE TABLE "previous_institute_informations" (
    "previous_institute_information_id" TEXT NOT NULL,
    "institute_name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "result" TEXT,
    "tc_no" TEXT,
    "institute_address_id" TEXT,
    "student_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "previous_institute_informations_pkey" PRIMARY KEY ("previous_institute_information_id")
);

-- CreateTable
CREATE TABLE "responsible_guardians" (
    "responsible_guardian_id" TEXT NOT NULL,
    "guardian" TEXT NOT NULL,
    "nid_no" TEXT,
    "occupation" TEXT,
    "job_title" TEXT,
    "educational_qualification" "EducationDegree",
    "monthly_income" TEXT,
    "mobile_no_1" TEXT,
    "mobile_no_2" TEXT,
    "mobile_no_3" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "responsible_guardians_pkey" PRIMARY KEY ("responsible_guardian_id")
);

-- CreateTable
CREATE TABLE "class_routine" (
    "class_routine_id" TEXT NOT NULL,
    "day" "WeekDays" NOT NULL,
    "period_id" TEXT NOT NULL,
    "teacher_id" TEXT NOT NULL,
    "class_id" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "class_routine_pkey" PRIMARY KEY ("class_routine_id")
);

-- CreateTable
CREATE TABLE "interview_information" (
    "interview_information_id" TEXT NOT NULL,
    "writen_marks" DOUBLE PRECISION,
    "viva_voice_mark" DOUBLE PRECISION,
    "practical_mark" DOUBLE PRECISION,
    "total_mark" DOUBLE PRECISION,
    "joining_history_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "interview_information_pkey" PRIMARY KEY ("interview_information_id")
);

-- CreateTable
CREATE TABLE "joining_history" (
    "joining_history_id" TEXT NOT NULL,
    "applied_position" TEXT,
    "joining_date" TIMESTAMP(3),
    "resign_data" TIMESTAMP(3),
    "teacher_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "joining_history_pkey" PRIMARY KEY ("joining_history_id")
);

-- CreateTable
CREATE TABLE "periods" (
    "period_id" TEXT NOT NULL,
    "period_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "periods_pkey" PRIMARY KEY ("period_id")
);

-- CreateTable
CREATE TABLE "previous_institute_information" (
    "teacher_previous_institute_information_id" TEXT NOT NULL,
    "institute_name" TEXT,
    "institute_contact" TEXT,
    "job_duration_year" INTEGER,
    "job_duration_month" INTEGER,
    "salary" INTEGER,
    "designation" TEXT,
    "joining_history_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "previous_institute_information_pkey" PRIMARY KEY ("teacher_previous_institute_information_id")
);

-- CreateTable
CREATE TABLE "promoted_history" (
    "promoted_history_id" TEXT NOT NULL,
    "previous_position" TEXT NOT NULL,
    "promoted_position" TEXT NOT NULL,
    "previous_position_joining_date" TIMESTAMP(3) NOT NULL,
    "previous_position_ending_date" TIMESTAMP(3) NOT NULL,
    "promoted_position_joining_date" TIMESTAMP(3) NOT NULL,
    "joining_history_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "promoted_history_pkey" PRIMARY KEY ("promoted_history_id")
);

-- CreateTable
CREATE TABLE "TReferences" (
    "reference_id" TEXT NOT NULL,
    "ref1_name" TEXT,
    "ref1_mobile_number" TEXT,
    "ref1_occupation" TEXT,
    "ref1_job_title" TEXT,
    "ref2_name" TEXT,
    "ref2_mobile_number" TEXT,
    "ref2_occupation" TEXT,
    "ref2_job_title" TEXT,
    "joining_history_id" TEXT,

    CONSTRAINT "TReferences_pkey" PRIMARY KEY ("reference_id")
);

-- CreateTable
CREATE TABLE "responsibilities" (
    "responsibility_id" TEXT NOT NULL,
    "responsibility_name" TEXT NOT NULL,
    "teacher_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "responsibilities_pkey" PRIMARY KEY ("responsibility_id")
);

-- CreateTable
CREATE TABLE "students_in_responsibility" (
    "student_responsibility_id" TEXT NOT NULL,
    "responsibility_start" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "responsibility_end" TIMESTAMP(3),
    "teacher_id" TEXT,
    "student_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "students_in_responsibility_pkey" PRIMARY KEY ("student_responsibility_id")
);

-- CreateTable
CREATE TABLE "subject_teachers" (
    "subject_teacher_id" TEXT NOT NULL,
    "subject_name" TEXT NOT NULL,
    "teacher_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "subject_teachers_pkey" PRIMARY KEY ("subject_teacher_id")
);

-- CreateTable
CREATE TABLE "active_inactive_histories" (
    "active_inactive_history_id" TEXT NOT NULL,
    "active_status" "ActiveStatus" NOT NULL,
    "activation_time" TIMESTAMP(3),
    "inactivation_time" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "active_inactive_histories_pkey" PRIMARY KEY ("active_inactive_history_id")
);

-- CreateTable
CREATE TABLE "father_details" (
    "father_details_id" TEXT NOT NULL,
    "father_name" TEXT NOT NULL,
    "nid_no" TEXT,
    "occupation" TEXT,
    "job_title" TEXT,
    "educational_qualification" "EducationDegree",
    "monthly_income" TEXT,
    "mobile_no_1" TEXT,
    "mobile_no_2" TEXT,
    "mobile_no_3" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "father_details_pkey" PRIMARY KEY ("father_details_id")
);

-- CreateTable
CREATE TABLE "mother_details" (
    "mother_details_id" TEXT NOT NULL,
    "mother_name" TEXT NOT NULL,
    "nid_no" TEXT,
    "occupation" TEXT,
    "job_title" TEXT,
    "educational_qualification" "EducationDegree",
    "monthly_income" TEXT,
    "mobile_no_1" TEXT,
    "mobile_no_2" TEXT,
    "mobile_no_3" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "mother_details_pkey" PRIMARY KEY ("mother_details_id")
);

-- CreateTable
CREATE TABLE "positions" (
    "position_id" TEXT NOT NULL,
    "position_name" TEXT NOT NULL,
    "role_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "positions_pkey" PRIMARY KEY ("position_id")
);

-- CreateTable
CREATE TABLE "roles" (
    "role_id" TEXT NOT NULL,
    "role_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "roles_pkey" PRIMARY KEY ("role_id")
);

-- CreateTable
CREATE TABLE "academic_years" (
    "academic_year_id" TEXT NOT NULL,
    "academic_year_number" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "academic_years_pkey" PRIMARY KEY ("academic_year_id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "audit_id" TEXT NOT NULL,
    "entityName" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "action" "AuditAction" NOT NULL,
    "created_by_id" TEXT NOT NULL,
    "old_value" JSONB,
    "new_value" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("audit_id")
);

-- CreateTable
CREATE TABLE "BookClass" (
    "book_id" TEXT NOT NULL,
    "class_id" TEXT NOT NULL,
    "created_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "BookClass_pkey" PRIMARY KEY ("book_id","class_id")
);

-- CreateTable
CREATE TABLE "books" (
    "book_id" TEXT NOT NULL,
    "book_name" TEXT NOT NULL,
    "publication" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "books_pkey" PRIMARY KEY ("book_id")
);

-- CreateTable
CREATE TABLE "classes" (
    "class_id" TEXT NOT NULL,
    "class_name" TEXT NOT NULL,
    "created_by_id" TEXT,
    "grade_teacher_id" TEXT,
    "group_teacher_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "classes_pkey" PRIMARY KEY ("class_id")
);

-- CreateTable
CREATE TABLE "students" (
    "student_id" TEXT NOT NULL,
    "active_class_id" TEXT NOT NULL,
    "responsible_guardian_id" TEXT,
    "user_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "students_pkey" PRIMARY KEY ("student_id")
);

-- CreateTable
CREATE TABLE "teachers" (
    "teacher_id" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "current_position" TEXT,
    "positions" TEXT[],
    "teaching_experience_year" INTEGER,
    "teaching_experience_month" INTEGER,
    "alternative_contact_no" TEXT[],
    "extra_curricular_activities" TEXT[],
    "user_id" TEXT NOT NULL,
    "is_subject_teacher" BOOLEAN NOT NULL DEFAULT false,
    "is_responsible_teacher" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "teachers_pkey" PRIMARY KEY ("teacher_id")
);

-- CreateTable
CREATE TABLE "users" (
    "user_id" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "mobile_number" TEXT NOT NULL,
    "is_mobile_verified" BOOLEAN NOT NULL DEFAULT false,
    "gender" "Gender" NOT NULL,
    "blood_group" "BloodGroup",
    "date_of_birth" TIMESTAMP(3),
    "height_in_cm" DOUBLE PRECISION,
    "weight_in_kg" DOUBLE PRECISION,
    "religion" "Religion",
    "nationality" TEXT NOT NULL DEFAULT 'Bangladeshi',
    "birth_certificate_number" TEXT,
    "nid_number" TEXT,
    "photo_url" TEXT,
    "father_details_id" TEXT,
    "mother_details_id" TEXT,
    "email" TEXT,
    "user_name" TEXT,
    "user_password" TEXT DEFAULT 'sm1234ps',
    "active_status" "ActiveStatus" NOT NULL DEFAULT 'ACTIVE',
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "position_id" TEXT NOT NULL,
    "role_name" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "_student_classes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_student_classes_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "academic_results_teacher_id_key" ON "academic_results"("teacher_id");

-- CreateIndex
CREATE UNIQUE INDEX "permanent_addresses_user_id_key" ON "permanent_addresses"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "permanent_addresses_spouse_id_key" ON "permanent_addresses"("spouse_id");

-- CreateIndex
CREATE UNIQUE INDEX "present_addresses_user_id_key" ON "present_addresses"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "present_addresses_spouse_id_key" ON "present_addresses"("spouse_id");

-- CreateIndex
CREATE UNIQUE INDEX "spouse_infromation_teacher_id_key" ON "spouse_infromation"("teacher_id");

-- CreateIndex
CREATE UNIQUE INDEX "previous_institute_informations_institute_address_id_key" ON "previous_institute_informations"("institute_address_id");

-- CreateIndex
CREATE UNIQUE INDEX "class_routine_day_period_id_teacher_id_key" ON "class_routine"("day", "period_id", "teacher_id");

-- CreateIndex
CREATE UNIQUE INDEX "class_routine_day_period_id_class_id_key" ON "class_routine"("day", "period_id", "class_id");

-- CreateIndex
CREATE UNIQUE INDEX "interview_information_joining_history_id_key" ON "interview_information"("joining_history_id");

-- CreateIndex
CREATE UNIQUE INDEX "previous_institute_information_joining_history_id_key" ON "previous_institute_information"("joining_history_id");

-- CreateIndex
CREATE UNIQUE INDEX "promoted_history_joining_history_id_key" ON "promoted_history"("joining_history_id");

-- CreateIndex
CREATE UNIQUE INDEX "TReferences_joining_history_id_key" ON "TReferences"("joining_history_id");

-- CreateIndex
CREATE UNIQUE INDEX "responsibilities_responsibility_name_key" ON "responsibilities"("responsibility_name");

-- CreateIndex
CREATE UNIQUE INDEX "students_in_responsibility_student_id_key" ON "students_in_responsibility"("student_id");

-- CreateIndex
CREATE UNIQUE INDEX "positions_position_name_key" ON "positions"("position_name");

-- CreateIndex
CREATE UNIQUE INDEX "roles_role_name_key" ON "roles"("role_name");

-- CreateIndex
CREATE INDEX "books_book_name_idx" ON "books"("book_name");

-- CreateIndex
CREATE UNIQUE INDEX "books_book_name_publication_key" ON "books"("book_name", "publication");

-- CreateIndex
CREATE UNIQUE INDEX "classes_class_name_key" ON "classes"("class_name");

-- CreateIndex
CREATE UNIQUE INDEX "classes_grade_teacher_id_key" ON "classes"("grade_teacher_id");

-- CreateIndex
CREATE UNIQUE INDEX "classes_group_teacher_id_key" ON "classes"("group_teacher_id");

-- CreateIndex
CREATE UNIQUE INDEX "students_user_id_key" ON "students"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "teachers_user_id_key" ON "teachers"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_user_name_key" ON "users"("user_name");

-- CreateIndex
CREATE UNIQUE INDEX "users_full_name_mobile_number_key" ON "users"("full_name", "mobile_number");

-- CreateIndex
CREATE INDEX "_student_classes_B_index" ON "_student_classes"("B");

-- AddForeignKey
ALTER TABLE "academic_results" ADD CONSTRAINT "academic_results_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "teachers"("teacher_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permanent_addresses" ADD CONSTRAINT "permanent_addresses_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permanent_addresses" ADD CONSTRAINT "permanent_addresses_spouse_id_fkey" FOREIGN KEY ("spouse_id") REFERENCES "spouse_infromation"("spouse_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "present_addresses" ADD CONSTRAINT "present_addresses_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "present_addresses" ADD CONSTRAINT "present_addresses_spouse_id_fkey" FOREIGN KEY ("spouse_id") REFERENCES "spouse_infromation"("spouse_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spouse_infromation" ADD CONSTRAINT "spouse_infromation_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "teachers"("teacher_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "previous_institute_informations" ADD CONSTRAINT "previous_institute_informations_institute_address_id_fkey" FOREIGN KEY ("institute_address_id") REFERENCES "institute_addresses"("institute_address_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "previous_institute_informations" ADD CONSTRAINT "previous_institute_informations_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "students"("student_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_period_id_fkey" FOREIGN KEY ("period_id") REFERENCES "periods"("period_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "teachers"("teacher_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "classes"("class_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "interview_information" ADD CONSTRAINT "interview_information_joining_history_id_fkey" FOREIGN KEY ("joining_history_id") REFERENCES "joining_history"("joining_history_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "joining_history" ADD CONSTRAINT "joining_history_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "teachers"("teacher_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "previous_institute_information" ADD CONSTRAINT "previous_institute_information_joining_history_id_fkey" FOREIGN KEY ("joining_history_id") REFERENCES "joining_history"("joining_history_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "promoted_history" ADD CONSTRAINT "promoted_history_joining_history_id_fkey" FOREIGN KEY ("joining_history_id") REFERENCES "joining_history"("joining_history_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TReferences" ADD CONSTRAINT "TReferences_joining_history_id_fkey" FOREIGN KEY ("joining_history_id") REFERENCES "joining_history"("joining_history_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "responsibilities" ADD CONSTRAINT "responsibilities_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "teachers"("teacher_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students_in_responsibility" ADD CONSTRAINT "students_in_responsibility_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "teachers"("teacher_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students_in_responsibility" ADD CONSTRAINT "students_in_responsibility_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "students"("student_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subject_teachers" ADD CONSTRAINT "subject_teachers_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "teachers"("teacher_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "active_inactive_histories" ADD CONSTRAINT "active_inactive_histories_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "positions" ADD CONSTRAINT "positions_role_name_fkey" FOREIGN KEY ("role_name") REFERENCES "roles"("role_name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuditLog" ADD CONSTRAINT "AuditLog_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookClass" ADD CONSTRAINT "BookClass_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "books"("book_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookClass" ADD CONSTRAINT "BookClass_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "classes"("class_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookClass" ADD CONSTRAINT "BookClass_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "books" ADD CONSTRAINT "books_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "books" ADD CONSTRAINT "books_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_grade_teacher_id_fkey" FOREIGN KEY ("grade_teacher_id") REFERENCES "teachers"("teacher_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_group_teacher_id_fkey" FOREIGN KEY ("group_teacher_id") REFERENCES "teachers"("teacher_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("user_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_active_class_id_fkey" FOREIGN KEY ("active_class_id") REFERENCES "classes"("class_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_responsible_guardian_id_fkey" FOREIGN KEY ("responsible_guardian_id") REFERENCES "responsible_guardians"("responsible_guardian_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teachers" ADD CONSTRAINT "teachers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_father_details_id_fkey" FOREIGN KEY ("father_details_id") REFERENCES "father_details"("father_details_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_mother_details_id_fkey" FOREIGN KEY ("mother_details_id") REFERENCES "mother_details"("mother_details_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "positions"("position_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_role_name_fkey" FOREIGN KEY ("role_name") REFERENCES "roles"("role_name") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_student_classes" ADD CONSTRAINT "_student_classes_A_fkey" FOREIGN KEY ("A") REFERENCES "classes"("class_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_student_classes" ADD CONSTRAINT "_student_classes_B_fkey" FOREIGN KEY ("B") REFERENCES "students"("student_id") ON DELETE CASCADE ON UPDATE CASCADE;
