import cookieParser from "cookie-parser";
import express, { Application, Request, Response } from "express";
import cors from "cors";
import { html } from "./utils/html.js";
import { notFound } from "./middlewares/notFound.js";
import { globalErrorHandler } from "./middlewares/globalErrorHandler.js";
import { roleRouter } from "./modules/roles/role_routes.js";
import { positionRouter } from "./modules/positions/position_routes.js";
import { responsibilityRouter } from "./modules/responsibilities/responsibilities_routes.js";

const app:Application = express();
app.use(cors())
app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(cookieParser())
app.get("/", (req:Request,res:Response)=>{
    res.send(html)
});
app.use("/smps/roles", roleRouter);
app.use("/smps/positions", positionRouter);
app.use("/smps/responsibillities", responsibilityRouter);
app.use(notFound);
app.use(globalErrorHandler);
export default app;