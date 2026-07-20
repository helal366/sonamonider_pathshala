import { Router } from "express";
import { responsibilityController } from "./responsibilities_controllers.js";

export const responsibilitiesRouter:Router=Router();
responsibilitiesRouter.post("/create", responsibilityController.createResponsibility)