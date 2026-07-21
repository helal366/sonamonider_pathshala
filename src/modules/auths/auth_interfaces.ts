import { BloodGroup, Gender, Religion } from "#db-client";

export interface IAuthLogin {
  full_name: string;
  mobile_number: string;
}

export interface IUser {
  user_id: string;
  full_name: string;
  mobile_number: string;
  role_name: string;
  position_name: string;
  activation_status: boolean;
  gender: Gender; // Use your custom enum
  blood_group?: BloodGroup | null; // Optional fields
  date_of_birth?: Date | string | null; // Can be ISO string
  heightInCm?: number | null;
  weightInKg?: number | null;
  religion?: Religion | null;
  nationality?: string | null;
  birth_certificate_number?: string | null;
  nid_number?: string | null;
  father_name?: string | null;
  mother_name?: string | null;
  email?: string | null;
  user_name?: string | null;
  user_password?: string | null;
  created_at: Date | string;
  updated_at: Date | string;
}
