import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";

const createPosition=async(positionName:string)=>{
    const cleanPositionName = positionName.trim().toUpperCase();
    const existingPositionName= await prisma.position.findUnique({
        where : {
            position_name: cleanPositionName
        }
    });
    if(existingPositionName){
        throw new AppError(`Position already exists`, StatusCodes.CONFLICT)
    };
    const createdPosition = await prisma.position.create({
        data:{
            position_name: cleanPositionName
        }
    });
    return createdPosition 
};

const deletePosition= async(positionName:string)=>{
    const cleanPositionName = positionName.trim().toUpperCase();
    const existingPositionName=await prisma.position.findUnique({
        where: {
            position_name: cleanPositionName
        }
    });
    if(!existingPositionName){
        throw new AppError("Position not found.", StatusCodes.BAD_REQUEST);
    };
    await prisma.position.delete({
        where: {
            position_name: cleanPositionName
        }
    })
};

const getAllPositions=async()=>{
    const allRetrievedPositions = await prisma.position.findMany();
    const allPositions = allRetrievedPositions.map(singlePosition=>singlePosition.position_name)
    return allPositions
};

const updatePosition=async()=>{

}
export const positionServices={
    createPosition,
    deletePosition,
    getAllPositions,
    updatePosition

}