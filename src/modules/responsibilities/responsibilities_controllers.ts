import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { sendResponse } from "../../utils/sendResponse.js";
import { StatusCodes } from "http-status-codes";
import { AppError } from "../../utils/appError.js";
import { responsibilityServices } from "./responsibilities_services.js";

const createResponsibility = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const { responsibilityName } = req.body;
    if (
      !responsibilityName ||
      Array.isArray(responsibilityName) ||
      typeof responsibilityName !== "string" ||
      responsibilityName.trim() === ""
    ) {
        throw new AppError("Invalid Responsibility Name", StatusCodes.BAD_REQUEST)
    }
    const result = await responsibilityServices.createResponsibility(responsibilityName)
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.CREATED,
      message: "Responsibility created successfully.",
      data: result,
    });
  },
);
export const responsibilityController = {
  createResponsibility,
};
