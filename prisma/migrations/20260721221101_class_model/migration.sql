-- CreateEnum
CREATE TYPE "ActiveStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "active_status" "ActiveStatus" NOT NULL DEFAULT 'ACTIVE';

-- CreateTable
CREATE TABLE "active_inactive_histories" (
    "active_inactive_history_id" TEXT NOT NULL,
    "active_status" "ActiveStatus" NOT NULL,
    "activationTime" TIMESTAMP(3),
    "inactivationTime" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "active_inactive_histories_pkey" PRIMARY KEY ("active_inactive_history_id")
);

-- CreateTable
CREATE TABLE "classes" (
    "class_id" TEXT NOT NULL,
    "class_name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "classes_pkey" PRIMARY KEY ("class_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "classes_class_name_key" ON "classes"("class_name");

-- AddForeignKey
ALTER TABLE "active_inactive_histories" ADD CONSTRAINT "active_inactive_histories_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;
