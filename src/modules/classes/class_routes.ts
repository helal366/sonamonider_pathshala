import { Router } from "express";
import { classControllers } from "./class_controllers.js";

export const classRouter:Router=Router();
classRouter.post("/create", classControllers.createClass)