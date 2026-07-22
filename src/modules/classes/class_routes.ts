import { Router } from "express";
import { classControllers } from "./class_controllers.js";
import { userAuth } from "../../middlewares/userAuth.js";

export const classRouter:Router=Router();
classRouter.post("/create", userAuth("SUPER_ADMIN"), classControllers.createClass)