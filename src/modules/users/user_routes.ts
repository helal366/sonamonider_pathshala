import { Router } from "express";
import { userControllers } from "./user_controllers.js";
import { userAuth } from "../../middlewares/userAuth.js";

export const userRouter:Router=Router(); 
userRouter.post("/create", userControllers.createUser);
userRouter.patch("/", userControllers.updateUser);

// userAuth("SUPER_ADMIN", "ADMIN", "MANAGEMENT"), 