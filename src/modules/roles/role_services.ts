import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js"
import { AppError } from "../../utils/appError.js";

const createRole = async (role_name: string)=>{
    const existingRole = await prisma.role.findUnique({
        where: {
            role_name
        }
    });
    if(existingRole){
        throw new AppError("Role already exists", StatusCodes.CONFLICT)
    }
    const createdRole = await prisma.role.create({
        data:{
            role_name
        }
    });
    return createdRole;
}

const deleteRole = async (roleName: string)=>{
    const cleanRoleName = roleName.trim().toUpperCase();
    const existingRole = await prisma.role.findUnique({
        where: { role_name: cleanRoleName }
    });
    if (!existingRole) {
        throw new AppError("Role not found", StatusCodes.NOT_FOUND);
    }
    await prisma.role.delete({
        where: { role_name: cleanRoleName }
    });
}

export const roleServices = {
    createRole,
    deleteRole
}