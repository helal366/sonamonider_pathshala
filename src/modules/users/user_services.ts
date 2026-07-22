import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { ICreateUserRequest, IUpdateUserRequest } from "./user_interfaces.js";
// import { checkRoleValidity } from "../../helperFunctions/user/roleValidityCheck.js";
import { checkPositionValidity } from "../../helperFunctions/user/positionValidityCheck.js";
import { validateStrictBDMobile } from "../../helperFunctions/user/mobileNumberValidityCheck.js";
import bcrypt from "bcryptjs";
import { envVars } from "../../configs/index.js";

const createUser = async (payload: ICreateUserRequest) => {
  const mobileNumber = await validateStrictBDMobile(payload.mobile_number);
  const existingUser = await prisma.user.findUnique({
    where: {
      user_full_name_mobile_unique: {
        full_name: payload.full_name,
        mobile_number: mobileNumber,
      },
    },
    select: { user_id: true },
  });
  if (existingUser) {
    throw new AppError("User already exists.", StatusCodes.CONFLICT);
  }

  const existingCount = await prisma.user.count({
    where: {
      mobile_number:mobileNumber
    }
  })
  
  const unique_user_name = existingCount === 0 ? mobileNumber: `${mobileNumber}-${existingCount+1}`
  // const clean_role_name = payload?.role_name ?payload.role_name.trim().toUpperCase() : null;
  const clean_position_name = payload.position_name.trim().toUpperCase();
  // role and position and mobile number validity check
  // if(clean_role_name){
  //   await checkRoleValidity(clean_role_name);
  // }
  const clean_role_name= await checkPositionValidity(clean_position_name);
  

  const defaultPassword = payload.user_password || "sm1234ps";
  const hashedPassword = await bcrypt.hash(
    defaultPassword,
    Number(envVars.BCRYPT_SALT_ROUND),
  );

  const parsedDOB = payload.date_of_birth
    ? new Date(payload.date_of_birth)
    : null;

  // Use payload status or fallback to schema default (ACTIVE)
  const initialStatus = payload.active_status || "ACTIVE";
  const now = new Date();

  const finalPayload = {
    ...payload,
    role_name: clean_role_name,
    position_name: clean_position_name,
    mobile_number: mobileNumber,
    date_of_birth: parsedDOB,
    user_name: unique_user_name,
    user_password: hashedPassword,
    active_status: initialStatus
  };

const createdUser = await prisma.$transaction(async(tx)=>{
    const user = await tx.user.create({
        data: finalPayload
    });

    const activationHistoryData= {
        user_id: user.user_id,
        active_status: initialStatus,
        activationTime: initialStatus==="ACTIVE"? now:null,
        inactivationTime: initialStatus==="INACTIVE"?now:null
    };
    await tx.activeInactiveHistory.create({
        data: activationHistoryData
    });
    return user
});

  const { user_password, ...secureUser } = createdUser;
  return secureUser;
};

const updateUser = async (payload: IUpdateUserRequest) => {
  return null;
};
export const userServices = {
  createUser,
  updateUser,
};
