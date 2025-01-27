import React, { createContext, useEffect, useState } from "react";

export const UserContext = createContext();

const Context = (props) => {
  const [data, setData] = useState({
    0: [
      {
        AlertLevel: "null",
        AlertMessage: "null",
        AverageValue: "null",
        City: "Ahmedabad",
        Country: "India",
        Description:
          "Air pollution from manufacturing processes including dust and smoke",
        EmissionRate: "null",
        EmissionTimestamp: "null",
        EmissionType: "PM2.5",
        EndDate: "null",
        HazardLevel: "null",
        Humidity: 65.2,
        Latitude: 23.0225,
        LocationID: 1,
        Longitude: 72.5714,
        MeasurementUnit: "null",
        MetricName: "null",
        PopulationDensity: 12000,
        PrecipitationLevel: 0.2,
        ReadingAccuracy: "null",
        ReadingTimestamp: "null",
        Region: "Gujarat",
        SourceType: "Industrial Factory",
        StartDate: "null",
        Temperature: 28.5,
        ThresholdValue: "null",
        Value: "null",
        WeatherTimestamp: "2024-11-01T02:30:00.000Z",
        WindDirection: "North",
        WindSpeed: 12.3,
      },
    ],
    1: [],
  });
  useEffect(() => {
    fetch("http://localhost:8081/users")
      .then((res) => res.json())
      .then((result) => {
        // Convert the object of objects into an array of objects
        const dataArray = Object.values(result);
        setData(dataArray);
      })
      .catch((err) => console.log(err));
  }, []);
  return (
    <UserContext.Provider value={data}>{props.children}</UserContext.Provider>
  );
};

export default Context;
