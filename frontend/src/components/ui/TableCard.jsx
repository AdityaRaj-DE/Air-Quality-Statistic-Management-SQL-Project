import React, { useContext, useRef, useEffect } from "react";
import { UserContext } from "../../context/Context";
import { Link } from "react-router-dom";
import gsap from "gsap";
import { useGSAP } from "@gsap/react";

const TableCard = () => {
  const wdata = useContext(UserContext);
  const data = wdata[0]; // Accessing the first array of data
  const boxRef = useRef();
  const lineRefs = useRef([]);

  useGSAP(() => {
    // Animation for the box
    gsap.from(boxRef.current, {
      y: 100,
      duration: 0.5,
      opacity: 0,
    });

    // Animation for the table rows with stagger effect
    gsap.from(lineRefs.current, {
      y:50,
      delay:0.1,
      duration:0.1,
      opacity:0,
      stagger:0.1
    });
  }, []);

  return (
    <div ref={boxRef} className="h-screen">
      <div className="h-[85%] shadow-md bg-white dark:bg-[#242424] w-full rounded-xl flex flex-col items-center">
        <div className="w-11/12">
          <h1 className="text-black dark:text-white text-xl font-bold pt-5 pb-2">
            India's Status
          </h1>
        </div>
        {/* Table Headers */}
        <div className="h-96 w-full px-20">
          <div className="flex w-full flex-row justify-around">
            <h1 className="w-36 p-2 text-zinc-400 dark:text-[#555555] text-center">
              Location
            </h1>
            <h1 className="w-36 p-2 text-zinc-400 dark:text-[#555555] text-center">
              Status
            </h1>
            <h1 className="w-36 p-2 text-zinc-400 dark:text-[#555555] text-center">
              AQI
            </h1>
            <h1 className="w-36 p-2 text-zinc-400 dark:text-[#555555] text-center">
              Emission Type
            </h1>
            <h1 className="w-36 p-2 text-zinc-400 dark:text-[#555555] text-center">
              Temp.
            </h1>
            <h1 className="w-36 p-2 text-zinc-400 dark:text-[#555555] text-center">
              Humi.
            </h1>
          </div>

          {/* Divider */}
          <div className="w-full bg-zinc-300 dark:bg-zinc-700 h-0.5"></div>

          <div className="h-96 overflow-y-scroll no-scrollbar">
            {data.map((item, index) => (
              <Link
                key={index}
                to={`/${item.LocationID}`}
                ref={(el) => (lineRefs.current[index] = el)} // Store each row in the ref array
              >
                <div className="flex w-full flex-row justify-around group hover:bg-zinc-100 dark:hover:bg-[#202020] rounded-full">
                  <h1 className="w-36 text-zinc-900 dark:text-white p-2 text-center group-hover:text-zinc-700 dark:group-hover:text-zinc-200">
                    {item.City}
                  </h1>
                  <h1 className="w-36 text-zinc-900 dark:text-white p-2 text-center group-hover:text-zinc-700 dark:group-hover:text-zinc-200">
                    {item.HazardLevel || "N/A"}
                  </h1>
                  <h1 className="w-36 text-zinc-900 dark:text-white p-2 text-center group-hover:text-zinc-700 dark:group-hover:text-zinc-200">
                    {item.PollutionValue || "N/A"}
                  </h1>
                  <h1 className="w-36 text-zinc-900 dark:text-white p-2 text-center group-hover:text-zinc-700 dark:group-hover:text-zinc-200">
                    {item.EmissionType}
                  </h1>
                  <h1 className="w-36 text-zinc-900 dark:text-white p-2 text-center group-hover:text-zinc-700 dark:group-hover:text-zinc-200">
                    {item.Temperature}°C
                  </h1>
                  <h1 className="w-36 text-zinc-900 dark:text-white p-2 text-center group-hover:text-zinc-700 dark:group-hover:text-zinc-200">
                    {item.Humidity}%
                  </h1>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default TableCard;
