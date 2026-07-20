import { Router } from "express";
import { responsibilityController } from "./responsibilities_controllers.js";

export const responsibilityRouter:Router=Router();
responsibilityRouter.post("/create", responsibilityController.createResponsibility);
responsibilityRouter.get("/", responsibilityController.getAllResponsibilities);
responsibilityRouter.get("/singleResponsibility", responsibilityController.getSingleResponsibilityDetails);
responsibilityRouter.delete("/", responsibilityController.deleteSingleResponsibility);
responsibilityRouter.patch("/", responsibilityController.updateSingleResponsibility);