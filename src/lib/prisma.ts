import 'dotenv/config';
import { PrismaClient } from '#db-client';

// 1. Static imports for the Vercel Serverless environment
import { neonConfig } from '@neondatabase/serverless';
import { PrismaNeon } from '@prisma/adapter-neon'; // Note: PrismaNeon is exported directly from adapter-neon in Prisma 7
import ws from 'ws';

// 2. Static imports for the Local TCP development environment
import pg from 'pg';
import { PrismaPg } from '@prisma/adapter-pg';

type CustomPrismaClient = InstanceType<typeof PrismaClient>;
const globalForPrisma = globalThis as unknown as { prisma: CustomPrismaClient | undefined };

let prismaInstance: CustomPrismaClient;

if (process.env.VERCEL) {
  // Cloud Serverless Execution Rule
  neonConfig.webSocketConstructor = ws;
  const adapter = new PrismaNeon({ 
    connectionString: process.env.NEON_DB_LINK 
  });
  prismaInstance = new PrismaClient({ adapter });
} else {
  // Local Machine Execution Rule
  const pool = new pg.Pool({ 
    connectionString: process.env.NEON_DB_LINK_DIRECT 
  });
  const adapter = new PrismaPg(pool);
  prismaInstance = new PrismaClient({ adapter });
}

export const prisma = globalForPrisma.prisma ?? prismaInstance;

if (process.env.NODE_ENV !== 'production') {
  globalForPrisma.prisma = prisma;
}




// import 'dotenv/config';
// import pg from 'pg';
// import { PrismaPg } from '@prisma/adapter-pg';
// import { PrismaClient } from '#db-client';

// type CustomPrismaClient = InstanceType<typeof PrismaClient>;

// const globalForPrisma = globalThis as unknown as {
//   prisma: CustomPrismaClient | undefined;
// };

// // Initialize the native PostgreSQL pool over standard TCP
// const pool = new pg.Pool({ connectionString: process.env["NEON_DB_LINK_DIRECT"] });
// const adapter = new PrismaPg(pool);

// // Pass the adapter directly into the options object
// export const prisma =
//   globalForPrisma.prisma ??
//   new PrismaClient({ adapter });

// if (process.env.NODE_ENV !== 'production') {
//   globalForPrisma.prisma = prisma;
// }
