import { User } from "#db-client";

export interface IAuthLogin {
  user_name: string;
  user_password: string;
}

export type IUser = User
