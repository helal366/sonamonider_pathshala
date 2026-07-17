import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { sendResponse } from "../../utils/sendResponse.js";
import { StatusCodes } from "http-status-codes";
import { AppError } from "../../utils/appError.js";
import { roleServices } from "./role_services.js";

const createRole = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const roleData: string | undefined = req.body.role;
    if (!roleData || typeof roleData !== "string" || roleData.trim() === "") {
      throw new AppError("Invalid role data provided", StatusCodes.BAD_REQUEST);
    }
    const cleanRoleData: string = roleData.trim().toUpperCase();

    const newRole = await roleServices.createRole(cleanRoleData);
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.OK,
      message: "Role created successfully",
      data: newRole,
    });
  },
);

const deleteRole = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const roleName = req.body.roleName;
    if (!roleName || typeof roleName !== "string" || roleName.trim() === "") {
      throw new AppError("Invalid role name provided", StatusCodes.BAD_REQUEST);
    }
    const cleanRoleName = roleName.trim().toUpperCase();
    await roleServices.deleteRole(cleanRoleName);
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.OK,
      message: "Role deleted successfully",
    });
  },
);

export const roleController = {
  createRole,
  deleteRole,
};
