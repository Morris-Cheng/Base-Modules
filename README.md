# 🧩 Base Verilog Modules Library

This repository contains a collection of **reusable Verilog modules** designed for use in FPGA and digital logic design projects.  
Each module is organized in its own folder and includes:

- The Verilog source file (`.v`)  
- A dedicated README with usage instructions and pinout diagrams

---

## 📚 Available Modules

| Module | Description |
|:----------------------------|:----------------------------|
| [Clock Divider](https://github.com/Morris-Cheng/Base-Modules/tree/main/Clock_divider_module) | Divides the input clock frequency by a specified factor |
| [Delay Timer](https://github.com/Morris-Cheng/Base-Modules/tree/main/Delay_timer_module) | Generates a delayed pulse or enables signals after a fixed duration |
| [Display Driver](https://github.com/Morris-Cheng/Base-Modules/tree/main/Display_module) | 7-segment display driver supporting multiplexed output |
| [FIFO Data Buffer](https://github.com/Morris-Cheng/Base-Modules/tree/main/FIFO_module) | Parameterized FIFO for temporary data storage and transfer |
| [Pulse Generator](https://github.com/Morris-Cheng/Base-Modules/tree/main/Pulse_module) | Generates single or periodic pulses based on control input |
| [UART Receiver (`uart_rx`)](https://github.com/Morris-Cheng/Base-Modules/tree/main/UART_rx_module) | Receives serial data and outputs parallel data |
| [UART Transmitter (`uart_tx`)](https://github.com/Morris-Cheng/Base-Modules/tree/main/UART_tx_module) | Converts parallel data to serial data for transmission |

> 💡 More modules will be added soon as the library expands.

---

## 🧠 Purpose

This repository serves as a **centralized base library** for commonly used Verilog components.  
It’s designed to:
- Improve project organization  
- Simplify code reuse across multiple designs  
- Provide consistent, verified building blocks for FPGA projects

---

## 🛠️ Usage

To use any module:

1. Clone this repository or copy the required module folder into your project.
2. Include the `.v` file in your design sources.
3. Refer to the module’s local README for instantiation examples and pin descriptions.

```bash
git clone https://github.com/Morris-Cheng/Base-Modules.git
