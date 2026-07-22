import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { authServices } from "./auth_services.js";
import { IAuthLogin } from "./auth_interfaces.js";
import { sendResponse } from "../../utils/sendResponse.js";
import { StatusCodes } from "http-status-codes";

const authLogin=catchAsync(async(req:Request, res:Response, next:NextFunction)=>{
    const payload = req.body as IAuthLogin;
    const result = await authServices.authLogin(payload);
    sendResponse(res, {
        success: true,
        statusCode: StatusCodes.OK,
        message: "Credential login successful.",
        data: result
    })
});
export const authControllers={
    authLogin
}