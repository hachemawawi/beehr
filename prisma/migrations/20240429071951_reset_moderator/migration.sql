/*
  Warnings:

  - The values [SUPERVISOR] on the enum `Role` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `supervisor` on the `Leave` table. All the data in the column will be lost.
  - You are about to drop the column `supervisorNote` on the `Leave` table. All the data in the column will be lost.
  - You are about to drop the column `supervisor` on the `User` table. All the data in the column will be lost.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Role_new" AS ENUM ('USER', 'ADMIN', 'MODERATOR');
ALTER TABLE "User" ALTER COLUMN "role" DROP DEFAULT;
ALTER TABLE "User" ALTER COLUMN "role" TYPE "Role_new" USING ("role"::text::"Role_new");
ALTER TYPE "Role" RENAME TO "Role_old";
ALTER TYPE "Role_new" RENAME TO "Role";
DROP TYPE "Role_old";
ALTER TABLE "User" ALTER COLUMN "role" SET DEFAULT 'USER';
COMMIT;

-- AlterTable
ALTER TABLE "Leave" DROP COLUMN "supervisor",
DROP COLUMN "supervisorNote",
ADD COLUMN     "moderator" TEXT,
ADD COLUMN     "moderatorNote" TEXT;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "supervisor",
ADD COLUMN     "moderator" TEXT;
