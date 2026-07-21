import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";

const createClass= catchAsync(async(req:Request, res:Response, next:NextFunction)=>{
    
});

export const classControllers={
    createClass
}