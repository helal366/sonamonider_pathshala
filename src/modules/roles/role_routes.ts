import { Router } from "express";
import { roleController } from "./role_controllers.js";

export const roleRouter:Router=Router();

roleRouter.post("/create", roleController.createRole);
roleRouter.delete("/delete", roleController.deleteRole);
roleRouter.get("/", roleController.getAllRoles);
roleRouter.patch("/update", roleController.updateRole) //incomplete