/*
  Warnings:

  - You are about to drop the `Responsibility` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Responsibility";

-- CreateTable
CREATE TABLE "responsibilities" (
    "responsibility_id" TEXT NOT NULL,
    "responsibility_name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "responsibilities_pkey" PRIMARY KEY ("responsibility_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "responsibilities_responsibility_name_key" ON "responsibilities"("responsibility_name");
