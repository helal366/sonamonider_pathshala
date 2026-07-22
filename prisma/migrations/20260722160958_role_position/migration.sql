/*
  Warnings:

  - A unique constraint covering the columns `[user_name]` on the table `users` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `role_name` to the `positions` table without a default value. This is not possible if the table is not empty.
  - Made the column `user_name` on table `users` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "positions" ADD COLUMN     "role_name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "users" ALTER COLUMN "user_name" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "users_user_name_key" ON "users"("user_name");

-- AddForeignKey
ALTER TABLE "positions" ADD CONSTRAINT "positions_role_name_fkey" FOREIGN KEY ("role_name") REFERENCES "roles"("role_name") ON DELETE RESTRICT ON UPDATE CASCADE;
