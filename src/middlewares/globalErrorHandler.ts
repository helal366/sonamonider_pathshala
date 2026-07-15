import type {Request, Response, NextFunction } from "express";
import { AppError } from "../utils/app_error.js";

export const globalErrorHandler=(error:Error|AppError, req:Request, res:Response, next:NextFunction)=>{
    let statusCode=error instanceof AppError? error.statusCode:500;
    const message=error.message;
    
    res.status(statusCode).json({
        success:false,
        message,
        error
    })
}