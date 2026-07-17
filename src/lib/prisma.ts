import 'dotenv/config';
import pg from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';
import { PrismaClient } from '#db-client';

type CustomPrismaClient = InstanceType<typeof PrismaClient>;

const globalForPrisma = globalThis as unknown as {
  prisma: CustomPrismaClient | undefined;
};

// Initialize the native PostgreSQL pool over standard TCP
const pool = new pg.Pool({ connectionString: process.env["NEON_DB_LINK_DIRECT"] });
const adapter = new PrismaPg(pool);

// Pass the adapter directly into the options object
export const prisma =
  globalForPrisma.prisma ??
  new PrismaClient({ adapter });

if (process.env.NODE_ENV !== 'production') {
  globalForPrisma.prisma = prisma;
}
