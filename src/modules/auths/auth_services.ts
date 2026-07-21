import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { IAuthLogin, IUser } from "./auth_interfaces.js";

const authLogin = async (payload: IAuthLogin) => {
  const { full_name, mobile_number } = payload;
  const existingAuth = (await prisma.user.findUnique({
    where: {
      user_full_name_mobile_unique: {
        full_name,
        mobile_number,
      },
    },
  })) as IUser;
  if (!existingAuth) {
    throw new AppError("No credential exists.", StatusCodes.BAD_REQUEST);
  }
  if (!existingAuth.active_status) {
    throw new AppError("Inactive user.", StatusCodes.UNAUTHORIZED);
  }
};

export const authServices = {
  authLogin,
};
