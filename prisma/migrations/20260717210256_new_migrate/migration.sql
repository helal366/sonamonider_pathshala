-- CreateTable
CREATE TABLE "responsibility" (
    "responsibility_id" TEXT NOT NULL,
    "responsibility_name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "responsibility_pkey" PRIMARY KEY ("responsibility_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "responsibility_responsibility_name_key" ON "responsibility"("responsibility_name");
