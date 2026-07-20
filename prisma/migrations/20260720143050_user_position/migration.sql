/*
  Warnings:

  - You are about to drop the `responsibility` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `position_name` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "users" ADD COLUMN     "position_name" TEXT NOT NULL;

-- DropTable
DROP TABLE "responsibility";

-- CreateTable
CREATE TABLE "Responsibility" (
    "responsibility_id" TEXT NOT NULL,
    "responsibility_name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Responsibility_pkey" PRIMARY KEY ("responsibility_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Responsibility_responsibility_name_key" ON "Responsibility"("responsibility_name");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_position_name_fkey" FOREIGN KEY ("position_name") REFERENCES "positions"("position_name") ON DELETE RESTRICT ON UPDATE CASCADE;
