import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { ICreateUserRequest, IUpdateUserRequest } from "./user_interfaces.js";
import { checkRoleValidity } from "../../helperFunctions/user/roleValidityCheck.js";
import { checkPositionValidity } from "../../helperFunctions/user/positionValidityCheck.js";
import { validateStrictBDMobile } from "../../helperFunctions/user/mobileNumberValidityCheck.js";
import bcrypt from "bcryptjs";
import { envVars } from "../../configs/index.js";

const createUser=async(payload:ICreateUserRequest)=>{
    const existingUser = await prisma.user.findUnique({
        where:{
            user_full_name_mobile_unique:{
                full_name: payload.full_name,
            mobile_number: payload.mobile_number
            }
        },
        select: {user_id:true}
    });
    if(existingUser){
        throw new AppError("User already exists.", StatusCodes.CONFLICT)
    };

    const clean_role_name = payload.role_name.trim().toUpperCase();
    const clean_position_name=payload.position_name.trim().toUpperCase();
    // role and position and mobile number validity check
    await checkRoleValidity(clean_role_name);
    await checkPositionValidity(clean_position_name);
    const mobileNumber =await validateStrictBDMobile(payload.mobile_number);

    const defaultPassword = payload.user_password || "smps1234";
    const hashedPassword=await bcrypt.hash(defaultPassword, Number(envVars.BCRYPT_SALT_ROUND));

    const parsedDOB = payload.date_of_birth ? new Date(payload.date_of_birth) : null;

    const finalPayload = {
        ...payload,
        role_name: clean_role_name,
        position_name: clean_position_name,
        mobile_number: mobileNumber,
        date_of_birth:parsedDOB,
        user_name: mobileNumber,
        user_password: hashedPassword
    };

    const createdUser = await prisma.user.create({
        data:finalPayload
    });

    const {user_password, ...secureUser} = createdUser
    return secureUser
}


const updateUser=async(payload:IUpdateUserRequest)=>{
    
}
export const userServices={
    createUser,
    updateUser
}