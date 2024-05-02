/*
  Warnings:

  - The values [MANAGER] on the enum `Role` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `manager` on the `Leave` table. All the data in the column will be lost.
  - You are about to drop the column `managerNote` on the `Leave` table. All the data in the column will be lost.
  - You are about to drop the column `manager` on the `User` table. All the data in the column will be lost.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Role_new" AS ENUM ('USER', 'ADMIN', 'SUPERVISOR');
ALTER TABLE "User" ALTER COLUMN "role" DROP DEFAULT;
ALTER TABLE "User" ALTER COLUMN "role" TYPE "Role_new" USING ("role"::text::"Role_new");
ALTER TYPE "Role" RENAME TO "Role_old";
ALTER TYPE "Role_new" RENAME TO "Role";
DROP TYPE "Role_old";
ALTER TABLE "User" ALTER COLUMN "role" SET DEFAULT 'USER';
COMMIT;

-- AlterTable
ALTER TABLE "Leave" DROP COLUMN "manager",
DROP COLUMN "managerNote",
ADD COLUMN     "supervisor" TEXT,
ADD COLUMN     "supervisorNote" TEXT;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "manager",
ADD COLUMN     "supervisor" TEXT;
