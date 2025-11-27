# wood-fuelled-boiler-monitor

## Hardware Overview

This project is based on a **ESP32** microcontroller that manages temperature measurements and controls the hydraulic system of the house.  
The main purpose is to monitor water and ambient temperatures using a **PT1000 temperature sensor** and to control the **circulation pumps** for:

- **Sanitary hot water (DHW)**
- **Radiator heating circuits**

### ESP32

The **ESP32** is the core of the system and is responsible for:

- **Reading temperature values** coming from the PT1000 sensor(s), through an appropriate signal conditioning circuit (for example, a precision resistor and an ADC input, or an external ADC / RTD interface).
- **Executing control logic** to decide when to turn pumps on or off, based on the measured temperatures and the configured setpoints.
- **Managing safety conditions**, such as:
  - Overtemperature protection
  - Minimum temperature protection (to avoid running pumps unnecessarily)
  - Detection of sensor faults (e.g. open circuit / short circuit conditions on the PT1000)

The ESP32 can also provide **communication interfaces** (such as Wi‑Fi, Bluetooth or serial), enabling:

- Remote monitoring of temperatures and pump status
- Configuration of setpoints (target temperatures)
- Logging or integration with home automation systems

### PT1000 Temperature Sensor

The **PT1000** is a platinum resistance temperature detector (RTD) with a nominal resistance of 1000 Ω at 0 °C. It is used in this project to obtain accurate and stable temperature measurements.

Key points about the PT1000 in this system:

- It is placed in thermal contact with the **sanitary hot water circuit** and/or the **radiator circuit** to measure the relevant water temperatures.
- The sensor signal is conditioned (with a suitable circuit) and then read by the ESP32 via an **analog‑to‑digital converter (ADC)**.
- The measured resistance is converted into temperature, and this temperature is used by the control algorithm to manage the pumps.

### Pump Control (Sanitary Hot Water and Radiators)

The system controls **pumps** that circulate hot water in two main subsystems:

1. **Sanitary Hot Water (DHW) Pump**
   - Ensures that hot water is available at taps and showers.
   - The ESP32 activates the DHW pump when:
     - The water temperature in the storage tank or primary circuit drops below a configurable **minimum setpoint**, and
     - Other safety or timing conditions are satisfied.
   - The pump is turned off when:
     - The target temperature is reached, or
     - The system detects an abnormal condition.

2. **Radiator Heating Pump**
   - Circulates hot water through the **radiators** to heat living spaces.
   - The ESP32 activates the radiator pump when:
     - The system is in **heating mode**, and
     - The measured temperature in the heating circuit requires circulation (e.g. water in the boiler or heat source is hot enough).
   - It can also take into account:
     - Schedules (day/night modes)
     - Ambient temperature or room thermostats (if present)

The pumps are usually controlled via **relays** or **solid state switches** driven by the ESP32’s digital outputs. The design must include:

- Electrical isolation between low‑voltage control electronics and mains‑powered pumps.
- Proper protection components (fuses, varistors, etc.), according to local electrical standards.

### Control Strategy (High‑Level)

The overall control logic typically follows these steps:

1. **Measure temperatures**
   - The ESP32 periodically reads the PT1000 sensor(s).
2. **Evaluate conditions**
   - Compare measured temperatures with configured setpoints for:
     - Sanitary hot water
     - Radiators / heating circuit
3. **Decide pump states**
   - If temperature is below the sanitary hot water setpoint, start the DHW pump (if safe).
   - If heating is requested and water is hot enough, start the radiator pump.
   - If target temperatures are reached or unsafe conditions are detected, stop the relevant pump(s).
4. **Apply safety rules**
   - Detect out‑of‑range sensor readings.
   - Enforce minimum run times or delays to avoid frequent on/off cycling.
   - Optionally log events or expose status via Wi‑Fi / API / home automation.

### Summary

In summary, this project uses an **ESP32** together with a **PT1000 temperature sensor** to:

- Continuously **monitor water temperatures** in the system.
- **Control the pumps** responsible for both **sanitary hot water** and **radiator heating**, according to configurable temperature thresholds and safety rules.

This architecture makes it possible to build a **flexible, connected and energy‑efficient** system for managing domestic hot water and central heating.
```


## HW 

LILYGO® TTGO T-Relay4 ESP32 
MAX31865 
