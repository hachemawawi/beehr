/*
  Warnings:

  - You are about to drop the column `moderator` on the `Leave` table. All the data in the column will be lost.
  - You are about to drop the column `moderatorNote` on the `Leave` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Leave" DROP COLUMN "moderator",
DROP COLUMN "moderatorNote",
ADD COLUMN     "manager" TEXT,
ADD COLUMN     "managerNote" TEXT;
