import { Router } from "express";
import { positionControllers } from "./position_controllers.js";

export const positionRouter:Router=Router();
positionRouter.post("/create", positionControllers.createPosition);
positionRouter.delete("/delete", positionControllers.deletePosition);
positionRouter.get("/", positionControllers.getAllPositions);
positionRouter.patch("/update", positionControllers.updatePosition)  //incomplete