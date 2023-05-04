import { Sequelize, DataTypes, Model } from "sequelize";
import * as dotenv from "dotenv";
dotenv.config();

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    dialect: "postgres",
    logging: false,
  }
);

try {
  sequelize.authenticate();
  console.log("Database Connected...👍️");
} catch (error) {
  console.error("Unable to connect to the database:", error);
}

const db = {};
db.sequelize = Sequelize;
db.sequelize = sequelize;

db.user = require("../models/userModel")(sequelize, DataTypes, Model);

db.sequelize.sync({ force: false });
module.exports = db;
