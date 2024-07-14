
# LED Blinking with Watchdog Supervision

## Project Overview

This project implements an LED blinking application with watchdog supervision capability on an AVR ATmega328P microcontroller. The project is structured into two main functionalities:

1. **LED Blinking**: Managed by the `LEDMgr` component using the `GPIO` component.
2. **Watchdog Supervision**: Handled by the `WDGDrv` and `WDGM` components.

## Components

### 1. GPIO
The GPIO component provides the basic functions to control the LED pin.
- **GPIO_Init**: Initializes the GPIO configuration for the LED pin.
- **GPIO_Write**: Writes a specific value (0 or 1) to the LED pin.

### 2. LEDMgr
The LEDMgr component manages the LED blinking functionality.
- **LEDM_Init**: Initializes the internal variables of the LED component.
- **LEDM_Manage**: Manages the LED blinking actions using the `GPIO_Write` function. This function is called from the main loop every 10ms and controls the LED blinking with a 500ms period for each stage.

### 3. WDGDrv
The WDGDrv component implements the watchdog driver for the ATmega328P microcontroller.
- **WDGDrv_Init**: Configures and activates the watchdog driver with a maximum timeout value of 64ms.

### 4. WDGM
The WDGM component provides supervision for the LEDM software entity.
- **WDGM_Init**: Initializes the internal variables of the WDGM component.
- **WDGM_MainFunction**: Checks the number of calls to `LEDM_Manage` within a 100ms period. If the number of calls is between 8 and 12, the status is set to OK; otherwise, it is set to NOK. This function is called every 20ms.
- **WDGM_PovideSuppervisionStatus**: Provides the status of the LEDM entity to the WDGDrv.
- **WDGM_AlivenessIndication**: Called from the `LEDM_Manage` function to indicate its call at the correct timing.

## Project Structure

```
.
├── GPIO.h
├── GPIO.c
├── LEDM.h
├── LEDM.c
├── WDGDrv.h
├── WDGDrv.c
├── WDGM.h
├── WDGM.c
├── TimerDrv.h
├── TimerDrv.c
├── main.c
└── README.md
```

## Scenarios

### A. Positive Scenario
This scenario checks the periodicity of the LED blinking, the call of the `LEDM_Manage`, the call of the `WDGM_MainFunction`, and the refreshment of the `WDGDrv`.

#### Timing Evidence
Use test pins to toggle on the oscilloscope to provide timing evidence.

### B. Negative Scenario 1
Comments out the call of the `WDGM_MainFunction` and checks that the watchdog reset occurs after 64ms.

### C. Negative Scenario 2
Comments out the call of the `WDGM_AlivenessIndication` from the `LEDM_Manage` while the `WDGM_MainFunction` is executed periodically and checks that the watchdog reset occurs after 114ms.

### D. Negative Scenario 3
Changes the periodicity of the call of the `LEDM_Manage` to every 5ms and checks that the watchdog reset occurs after 114ms.

## How to Run

1. Clone the repository to your local machine.
2. Open the project in your preferred IDE (e.g., Atmel Studio, VS Code).
3. Build the project.
4. Flash the compiled code onto the ATmega328P microcontroller.
5. Connect the microcontroller to an oscilloscope to observe the test pin outputs for timing verification.

## Simulation and Testing

### Required Tools
- AVR Simulator (e.g., Proteus)
- Oscilloscope

### Steps
1. Load the simulation file into the AVR simulator.
2. Connect the test pins to the oscilloscope.
3. Run the simulation.
4. Observe the oscilloscope output for the scenarios described above.

## Team Members

- [Rana Hany](https://github.com/RanaHany10)
- [Sarah Ibrahim](https://github.com/sarah1ibrahim)
- [Salma Ashraf](https://github.com/Salma-me)
- [Yasmin Tarek](https://github.com/JasmineTJ)
