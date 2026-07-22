import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { ICreatePosition } from "./position_interfaces.js";

const createPosition = async (payload:ICreatePosition) => {
    const {position_name, role_name}= payload;
  const clean_position_name = position_name.trim().toUpperCase();
  const existing = await prisma.position.findUnique({
    where: {
      position_name: clean_position_name,
    },
  });
  if (existing) {
    throw new AppError(`Position already exists`, StatusCodes.CONFLICT);
  }
  const createdPosition = await prisma.position.create({
    data: {
      position_name: clean_position_name,
      role_name
    },
  });
  return createdPosition;
};

const deletePosition = async (position_name: string) => {
  const clean_position_name = position_name.trim().toUpperCase();
  const existing = await prisma.position.findUnique({
    where: {
      position_name: clean_position_name,
    },
  });
  if (!existing) {
    throw new AppError("Position not found.", StatusCodes.BAD_REQUEST);
  }
  await prisma.position.delete({
    where: {
      position_name: clean_position_name,
    },
  });
};

const getAllPositions = async () => {
  const allRetrievedPositions = await prisma.position.findMany();
  const allPositions = allRetrievedPositions.map(
    (singlePosition) => singlePosition.position_name,
  );
  return allPositions;
};

const updatePosition = async () => {};
export const positionServices = {
  createPosition,
  deletePosition,
  getAllPositions,
  updatePosition,
};
