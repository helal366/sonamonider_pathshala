import { Router } from "express";
import { positionControllers } from "./position_controllers.js";

export const positionRouter:Router=Router();
positionRouter.post("/create", positionControllers.createPosition)