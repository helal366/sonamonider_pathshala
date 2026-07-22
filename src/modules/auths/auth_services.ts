import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { IAuthLogin, IUser } from "./auth_interfaces.js";

const authLogin = async (payload: IAuthLogin) => {
  const { user_name, user_password } = payload;
  const existingAuth = (await prisma.user.findMany({
    where: {
      user_name
    },
  })) as IUser[];
  if (existingAuth.length ===0) {
    throw new AppError("No credential exists.", StatusCodes.BAD_REQUEST);
  }
  // if (existingAuth.active_status === "INACTIVE") {
  //   throw new AppError("Inactive user.", StatusCodes.UNAUTHORIZED);
  // }
  return null
};

export const authServices = {
  authLogin,
};
