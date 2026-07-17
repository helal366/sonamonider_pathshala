-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE', 'OTHER');

-- CreateEnum
CREATE TYPE "BloodGroup" AS ENUM ('A_POSITIVE', 'A_NEGATIVE', 'B_POSITIVE', 'B_NEGATIVE', 'AB_POSITIVE', 'AB_NEGATIVE', 'O_POSITIVE', 'O_NEGATIVE');

-- CreateEnum
CREATE TYPE "Religion" AS ENUM ('ISLAM', 'HINDU', 'CHRISTIAN', 'BUDDO', 'OTHER');

-- CreateEnum
CREATE TYPE "Morning_Section" AS ENUM ('madrashatul_atfal', 'sonamonider_pathshala');

-- CreateTable
CREATE TABLE "roles" (
    "role_id" TEXT NOT NULL,
    "role_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("role_id")
);

-- CreateTable
CREATE TABLE "users" (
    "user_id" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "mobile_number" TEXT NOT NULL,
    "role_name" TEXT NOT NULL,
    "gender" "Gender" NOT NULL,
    "blood_group" "BloodGroup",
    "date_of_birth" TIMESTAMP(3),
    "heightInCm" DOUBLE PRECISION,
    "weightInKg" DOUBLE PRECISION,
    "religion" "Religion",
    "nationality" TEXT,
    "birth_certificate_number" TEXT,
    "nid_number" TEXT,
    "father_name" TEXT,
    "mother_name" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "roles_role_name_key" ON "roles"("role_name");

-- CreateIndex
CREATE UNIQUE INDEX "roles_role_id_role_name_key" ON "roles"("role_id", "role_name");

-- CreateIndex
CREATE UNIQUE INDEX "users_full_name_mobile_number_key" ON "users"("full_name", "mobile_number");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_role_name_fkey" FOREIGN KEY ("role_name") REFERENCES "roles"("role_name") ON DELETE RESTRICT ON UPDATE CASCADE;
