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

const getAllResponsibilities=async()=>{
    const allResponsibilites=await prisma.responsibility.findMany();
    const responsibilitiesInArray = allResponsibilites.map(responsibility=>responsibility.responsibility_name)
    return {
        responsibilitiesInArray,
        allResponsibilites,
    }
};

const getSingleResponsibilityDetails=async(responsibilityName:string)=>{
    const cleanResponsibility = responsibilityName.trim().toUpperCase();
    const singleResponsibility = await prisma.responsibility.findUniqueOrThrow({
        where:{
            responsibility_name: cleanResponsibility
        }
    });
    return singleResponsibility
};

const deleteSingleResponsibility=async(responsibilityName:string)=>{
    const cleanResponsibility = responsibilityName.trim().toUpperCase();
    const existingResponsibilityName = await prisma.responsibility.findUnique({
        where: {
            responsibility_name:cleanResponsibility
        }
    });
    if(!existingResponsibilityName){
        throw new AppError("Responsibility not exists.", StatusCodes.BAD_REQUEST)
    };
    await prisma.responsibility.delete({
        where:{
            responsibility_name:cleanResponsibility
        }
    })
};

const updateSingleResponsibility=async(presentResponsibility:string, updateResponsibility:string)=>{
    const cleanPresentResponsibility= presentResponsibility.trim().toUpperCase();
    const cleanUpdateResponsibility= updateResponsibility.trim().toUpperCase();
    await prisma.responsibility.findUniqueOrThrow({
        where:{
            responsibility_name: cleanPresentResponsibility
        }
    });
     const updatedResponsibility= await prisma.responsibility.update({
        where:{
            responsibility_name: cleanPresentResponsibility
        },
        data:{
            responsibility_name: cleanUpdateResponsibility
        }
     });
     return updatedResponsibility
}
export const responsibilityServices={
    createResponsibility,
    getAllResponsibilities,
    getSingleResponsibilityDetails,
    deleteSingleResponsibility,
    updateSingleResponsibility
}