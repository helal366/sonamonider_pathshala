import { BloodGroup, Gender, Religion } from "#db-client";

export interface ICreateUserRequest {
  // Required Core Fields
  full_name: string;
  mobile_number: string;
  role_name: string;        // Refers to the Role model key
  position_name: string;    // Refers to your dynamic Position model key
  gender: Gender;

  // Optional Demographic & Health Data
  blood_group?: BloodGroup | null;
  date_of_birth?: Date | string | null; // Accepts string from JSON body payloads, parsed to Date in backend
  heightInCm?: number | null;
  weightInKg?: number | null;
  religion?: Religion | null;
  nationality?: string | null;

  // Optional Identity Documents
  birth_certificate_number?: string | null;
  nid_number?: string | null;

  // Optional Family Background
  father_name?: string | null;
  mother_name?: string | null;

  // Optional System Authentication Fields
  email?: string | null;
  user_name?: string | null;
  user_password?: string;  // Optional: defaults to "smps1234" via your Prisma layer if omitted
}
