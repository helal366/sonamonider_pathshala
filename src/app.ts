// import express, {type Application, type Request, type Response } from "express";
// import { globalErrorHandler } from "./middlewares/globalErrorHandler.js";
// import { notFound } from "./middlewares/notFound.js";

// export const app:Application= express();
// app.use(express.json())
// app.get('/', (req:Request, res:Response)=>{
//     try {
//         return res.status(200).json({
//             success:true,
//             message: "Welcome to Sonamonider pathshala."
//         })
//     } catch (error:any) {
//         console.log(error)
//         return res.status(500).json({
//             success:false,
//             message: "Internal Server Error."
//         })
//     }

// })
// app.use(globalErrorHandler);
// app.use(notFound)

import cookieParser from "cookie-parser";
import express, { Application, Request, Response } from "express";
import cors from "cors";
import { envVars } from "./configs/index.js";
import { html } from "./utils/html.js";
import { notFound } from "./middlewares/notFound.js";
import { globalErrorHandler } from "./middlewares/globalErrorHandler.js";

const app:Application = express();
app.use(cors({
    origin: envVars.APP_LOCAL_URL,
    credentials: true,
}))
app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(cookieParser())
app.get("/", (req:Request,res:Response)=>{
    res.send(html)
});

app.use(notFound);
app.use(globalErrorHandler);
export default app;