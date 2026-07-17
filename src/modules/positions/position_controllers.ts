import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { AppError } from "../../utils/appError.js";
import { StatusCodes } from "http-status-codes";
import { positionServices } from "./position_services.js";
import { sendResponse } from "../../utils/sendResponse.js";

const createPosition = catchAsync(async(req:Request, res:Response, next:NextFunction)=>{
    const {positionName} = req.body;
    if(!positionName || Array.isArray(positionName) || typeof positionName !== "string" || positionName.trim()==="" ){
        throw new AppError("Invalid position name", StatusCodes.BAD_REQUEST)
    };
    const result = await positionServices.createPosition(positionName);
    sendResponse(res, {
        success: true,
        statusCode: StatusCodes.CREATED,
        message: "Position created successfully.",
        data: result
    })
});
export const positionControllers={
    createPosition
}