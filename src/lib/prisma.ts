import "dotenv/config";
import { neonConfig } from '@neondatabase/serverless';
import { PrismaNeon } from '@prisma/adapter-neon';
import ws from 'ws'; 
import { PrismaClient } from "#db-client";

neonConfig.webSocketConstructor = ws;

type CustomPrismaClient = InstanceType<typeof PrismaClient>;

const globalForPrisma = globalThis as unknown as {
  prisma: CustomPrismaClient | undefined;
};

// Pass the connection configuration object directly to avoid the Pool type conflict
const adapter = new PrismaNeon({ connectionString: process.env.NEON_DB_LINK });

export const prisma =
  globalForPrisma.prisma ?? new PrismaClient({ adapter });

if (process.env.NODE_ENV !== 'production') {
  globalForPrisma.prisma = prisma;
}

export const initDB = async () => {
  try {
    await prisma.$queryRaw`SELECT 1`;
    console.log(`Database (Neon + Prisma) connected successfully.`);
  } catch (error) {
    console.error("Database connection failed:", error);
  }
};
