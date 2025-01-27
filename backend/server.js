const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json()); // Middleware to parse JSON body

// Create a single database connection
const connection = mysql.createConnection({
  host: "localhost",
  database: "aqmproj",
  user: "root",
  password: "123456",
});

// Connect to the database once
connection.connect((err) => {
  if (err) {
    console.error("Database connection failed:", err);
    return;
  }
  console.log("Database connected!");
});

// Route for testing backend
app.get("/", (req, res) => {
  return res.json("from Backend side");
});

// Route for fetching data
app.get("/users", (req, res) => {
  // Queries for multiple tables
  const queries = {
    location:
      `SELECT 
    L.LocationID, 
    L.City, 
    L.Region, 
    L.Country, 
    L.Latitude, 
    L.Longitude, 
    L.PopulationDensity, 
    PS.SourceType, 
    PS.EmissionType, 
    PS.Description, 
    AQM.MetricName, 
    AQM.MeasurementUnit, 
    AQM.HazardLevel, 
    PR.Value AS PollutionValue, 
    PR.Timestamp AS PollutionTimestamp, 
    PR.ReadingAccuracy, 
    WC.Temperature, 
    WC.Humidity, 
    WC.WindSpeed, 
    WC.PrecipitationLevel, 
    WC.WindDirection, 
    WC.Timestamp AS WeatherTimestamp, 
    AT.ThresholdValue, 
    AT.AlertLevel, 
    AT.AlertMessage, 
    EI.EmissionRate, 
    EI.Timestamp AS EmissionTimestamp, 
    AQT.AverageValue, 
    AQT.StartDate, 
    AQT.EndDate
FROM 
    Location L
LEFT JOIN 
    PollutionSource PS ON L.LocationID = PS.LocationID
LEFT JOIN 
    PollutionReading PR ON L.LocationID = PR.LocationID
LEFT JOIN 
    AirQualityMetric AQM ON PR.MetricID = AQM.MetricID
LEFT JOIN 
    WeatherCondition WC ON L.LocationID = WC.LocationID
LEFT JOIN 
    AlertThresholds AT ON L.LocationID = AT.LocationID AND AT.MetricID = AQM.MetricID
LEFT JOIN 
    EmissionsInventory EI ON PS.SourceID = EI.SourceID AND EI.MetricID = AQM.MetricID
LEFT JOIN 
    AirQualityTrend AQT ON L.LocationID = AQT.LocationID AND AQT.MetricID = AQM.MetricID;`,
    airqualitymetric: "SELECT * FROM airqualitymetric",
  };

  // Object to store all results
  const data = {
    location: [],
    airqualitymetric: [],
  };

  // Execute all queries
  const queryPromises = Object.keys(queries).map(
    (key) =>
      new Promise((resolve, reject) => {
        connection.query(queries[key], (err, results) => {
          if (err) {
            console.error(`Error executing query for ${key}:`, err);
            return reject(err);
          }
          data[key] = results; // Assign results to corresponding key
          resolve();
        });
      })
  );

  // Wait for all queries to complete
  Promise.all(queryPromises)
    .then(() => res.json(data)) // Send combined data to the client
    .catch((err) =>
      res.status(500).json({ error: "Error fetching data", details: err })
    );
});

// API to insert data into Location table
app.post("/insert/location", (req, res) => {
  const {
    LocationID,
    City,
    Region,
    Country,
    Latitude,
    Longitude,
    PopulationDensity,
  } = req.body;

  const query = `
    INSERT INTO Location (LocationID, City, Region, Country, Latitude, Longitude, PopulationDensity) 
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;
  connection.query(
    query,
    [LocationID, City, Region, Country, Latitude, Longitude, PopulationDensity],
    (err, result) => {
      if (err) {
        console.error("Error inserting into Location table:", err);
        return res
          .status(500)
          .json({ error: "Failed to insert location data" });
      }
      res.json({ message: "Location data inserted successfully", result });
    }
  );
});

// API to insert data into PollutionSource table
app.post("/insert/pollutionsource", (req, res) => {
  const { SourceID, SourceType, EmissionType, Description, LocationID } =
    req.body;

  const query = `
    INSERT INTO PollutionSource (SourceID, SourceType, EmissionType, Description, LocationID) 
    VALUES (?, ?, ?, ?, ?)
  `;
  connection.query(
    query,
    [SourceID, SourceType, EmissionType, Description, LocationID],
    (err, result) => {
      if (err) {
        console.error("Error inserting into PollutionSource table:", err);
        return res
          .status(500)
          .json({ error: "Failed to insert pollution source data" });
      }
      res.json({
        message: "Pollution source data inserted successfully",
        result,
      });
    }
  );
});

// API to insert data into AirQualityMetric table
app.post("/insert/airqualitymetric", (req, res) => {
  const { MetricID, MetricName, MeasurementUnit, HazardLevel } = req.body;

  const query = `
    INSERT INTO AirQualityMetric (MetricID, MetricName, MeasurementUnit, HazardLevel) 
    VALUES (?, ?, ?, ?)
  `;
  connection.query(
    query,
    [MetricID, MetricName, MeasurementUnit, HazardLevel],
    (err, result) => {
      if (err) {
        console.error("Error inserting into AirQualityMetric table:", err);
        return res
          .status(500)
          .json({ error: "Failed to insert air quality metric data" });
      }
      res.json({
        message: "Air quality metric data inserted successfully",
        result,
      });
    }
  );
});

app.post("/insert/pollutionreading", (req, res) => {
  const {
    ReadingID,
    LocationID,
    MetricID,
    SourceID,
    Value,
    Timestamp,
    ReadingAccuracy,
  } = req.body;

  const query = `
    INSERT INTO pollutionreading (ReadingID, LocationID, MetricID, SourceID, Value, Timestamp, ReadingAccuracy) 
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;
  connection.query(
    query,
    [
      ReadingID,
      LocationID,
      MetricID,
      SourceID,
      Value,
      Timestamp,
      ReadingAccuracy,
    ],
    (err, result) => {
      if (err) {
        console.error("Error inserting into pollutionreading table:", err);
        return res
          .status(500)
          .json({ error: "Failed to insert pollution reading data" });
      }
      res.json({
        message: "pollution reading data inserted successfully",
        result,
      });
    }
  );
});

app.post("/insert/alertthresholds", (req, res) => {
  const {
    ThresholdID,
    MetricID,
    LocationID,
    ThresholdValue,
    AlertLevel,
    AlertMessage,
  } = req.body;

  const query = `
    INSERT INTO alertthresholds (ThresholdID, MetricID, LocationID, ThresholdValue, AlertLevel, AlertMessage) 
    VALUES (?, ?, ?, ?, ?, ?)
  `;
  connection.query(
    query,
    [
      ThresholdID,
      MetricID,
      LocationID,
      ThresholdValue,
      AlertLevel,
      AlertMessage,
    ],
    (err, result) => {
      if (err) {
        console.error("Error inserting into alertthresholds table:", err);
        return res
          .status(500)
          .json({ error: "Failed to insert alertthresholds data" });
      }
      res.json({
        message: "alertthresholds data inserted successfully",
        result,
      });
    }
  );
});

app.post("/insert/airqualitytrend", (req, res) => {
  const { TrendID, LocationID, MetricID, AverageValue, StartDate, EndDate } =
    req.body;

  const query = `
    INSERT INTO airqualitytrend (TrendID, LocationID, MetricID, AverageValue, StartDate, EndDate) 
    VALUES (?, ?, ?, ?, ?, ?)
  `;
  connection.query(
    query,
    [TrendID, LocationID, MetricID, AverageValue, StartDate, EndDate],
    (err, result) => {
      if (err) {
        console.error("Error inserting into airqualitytrend table:", err);
        return res
          .status(500)
          .json({ error: "Failed to insert airqualitytrend data" });
      }
      res.json({
        message: "airqualitytrend data inserted successfully",
        result,
      });
    }
  );
});

app.post("/insert/emissionsinventory", (req, res) => {
  const { InventoryID, SourceID, MetricID, EmissionRate, Timestamp } = req.body;

  const query = `
    INSERT INTO emissionsinventory (InventoryID, SourceID, MetricID, EmissionRate, Timestamp) 
    VALUES (?, ?, ?, ?, ?)
  `;
  connection.query(
    query,
    [InventoryID, SourceID, MetricID, EmissionRate, Timestamp],
    (err, result) => {
      if (err) {
        console.error("Error inserting into emissionsinventory table:", err);
        return res
          .status(500)
          .json({ error: "Failed to insert emissionsinventory data" });
      }
      res.json({
        message: "emissionsinventory data inserted successfully",
        result,
      });
    }
  );
});

app.post("/insert/weathercondition", (req, res) => {
  const {
    ConditionID,
    LocationID,
    Temprature,
    Humidity,
    WindSpeed,
    PrecipitationLevel,
    WindDirection,
    Timestamp,
  } = req.body;

  const query = `
    INSERT INTO weathercondition (ConditionID, LocationID, Temprature, Humidity, WindSpeed, PrecipitationLevel, WindDirection, Timestamp) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
  `;
  connection.query(
    query,
    [
      ConditionID,
      LocationID,
      Temprature,
      Humidity,
      WindSpeed,
      PrecipitationLevel,
      WindDirection,
      Timestamp,
    ],
    (err, result) => {
      if (err) {
        console.error("Error inserting into weathercondition table:", err);
        return res
          .status(500)
          .json({ error: "Failed to insert weathercondition data" });
      }
      res.json({
        message: "weathercondition data inserted successfully",
        result,
      });
    }
  );
});

// Delete from Location
app.delete("/delete/location/:LocationID", (req, res) => {
  const { LocationID } = req.params;
  const query = "DELETE FROM Location WHERE LocationID = ?";
  connection.query(query, [LocationID], (err, result) => {
    if (err) {
      console.error("Error deleting from Location table:", err);
      return res.status(500).json({ error: "Failed to delete location data" });
    }
    res.json({ message: "Location data deleted successfully", result });
  });
});

// Delete from PollutionSource
app.delete("/delete/pollutionsource/:SourceID", (req, res) => {
  const { SourceID } = req.params;
  const query = "DELETE FROM PollutionSource WHERE SourceID = ?";
  connection.query(query, [SourceID], (err, result) => {
    if (err) {
      console.error("Error deleting from PollutionSource table:", err);
      return res
        .status(500)
        .json({ error: "Failed to delete pollution source data" });
    }
    res.json({ message: "Pollution source data deleted successfully", result });
  });
});

// Delete from AirQualityMetric
app.delete("/delete/airqualitymetric/:MetricID", (req, res) => {
  const { MetricID } = req.params;
  const query = "DELETE FROM AirQualityMetric WHERE MetricID = ?";
  connection.query(query, [MetricID], (err, result) => {
    if (err) {
      console.error("Error deleting from AirQualityMetric table:", err);
      return res
        .status(500)
        .json({ error: "Failed to delete air quality metric data" });
    }
    res.json({
      message: "Air quality metric data deleted successfully",
      result,
    });
  });
});

// Delete from PollutionReading
app.delete("/delete/pollutionreading/:ReadingID", (req, res) => {
  const { ReadingID } = req.params;
  const query = "DELETE FROM PollutionReading WHERE ReadingID = ?";
  connection.query(query, [ReadingID], (err, result) => {
    if (err) {
      console.error("Error deleting from PollutionReading table:", err);
      return res
        .status(500)
        .json({ error: "Failed to delete pollution reading data" });
    }
    res.json({
      message: "Pollution reading data deleted successfully",
      result,
    });
  });
});

// Delete from WeatherCondition
app.delete("/delete/weathercondition/:ConditionID", (req, res) => {
  const { ConditionID } = req.params;
  const query = "DELETE FROM WeatherCondition WHERE ConditionID = ?";
  connection.query(query, [ConditionID], (err, result) => {
    if (err) {
      console.error("Error deleting from WeatherCondition table:", err);
      return res
        .status(500)
        .json({ error: "Failed to delete weather condition data" });
    }
    res.json({
      message: "Weather condition data deleted successfully",
      result,
    });
  });
});

// Delete from AlertThresholds
app.delete("/delete/alertthresholds/:ThresholdID", (req, res) => {
  const { ThresholdID } = req.params;
  const query = "DELETE FROM AlertThresholds WHERE ThresholdID = ?";
  connection.query(query, [ThresholdID], (err, result) => {
    if (err) {
      console.error("Error deleting from AlertThresholds table:", err);
      return res
        .status(500)
        .json({ error: "Failed to delete alert thresholds data" });
    }
    res.json({ message: "Alert thresholds data deleted successfully", result });
  });
});

// Delete from EmissionsInventory
app.delete("/delete/emissionsinventory/:InventoryID", (req, res) => {
  const { InventoryID } = req.params;
  const query = "DELETE FROM EmissionsInventory WHERE InventoryID = ?";
  connection.query(query, [InventoryID], (err, result) => {
    if (err) {
      console.error("Error deleting from EmissionsInventory table:", err);
      return res
        .status(500)
        .json({ error: "Failed to delete emissions inventory data" });
    }
    res.json({
      message: "Emissions inventory data deleted successfully",
      result,
    });
  });
});

// Delete from AirQualityTrend
app.delete("/delete/airqualitytrend/:TrendID", (req, res) => {
  const { TrendID } = req.params;
  const query = "DELETE FROM AirQualityTrend WHERE TrendID = ?";
  connection.query(query, [TrendID], (err, result) => {
    if (err) {
      console.error("Error deleting from AirQualityTrend table:", err);
      return res
        .status(500)
        .json({ error: "Failed to delete air quality trend data" });
    }
    res.json({
      message: "Air quality trend data deleted successfully",
      result,
    });
  });
});

// Start the server
app.listen(8081, () => {
  console.log("Server is listening on port 8081");
});
