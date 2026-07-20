import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";

const createResponsibility=async(responsibilityName:string)=>{
    const cleanResponsibility = responsibilityName.trim().toUpperCase();
    const existingResponsibilityName = await prisma.responsibility.findUnique({
        where: {
            responsibility_name:cleanResponsibility
        }
    });
    if(existingResponsibilityName){
        throw new AppError("Responsibility already exists.", StatusCodes.CONFLICT)
    };
    const responsilibity= prisma.responsibility.create({
        data: {
            responsibility_name:cleanResponsibility
        }
    });
    return responsilibity
};
export const responsibilityServices={
    createResponsibility,

}