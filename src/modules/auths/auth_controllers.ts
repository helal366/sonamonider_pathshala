import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { authServices } from "./auth_services.js";

const authLogin=catchAsync(async(req:Request, res:Response, next:NextFunction)=>{
    const payload = req.body;
    const result = await authServices.authLogin(payload)
});
export const authControllers={
    authLogin
}