# Base Verilog Modules Library

This repository contains a collection of reusable Verilog modules commonly used in digital design projects.  
Each module is located in its own folder with:
- The Verilog source file (`.v`)
- A README with usage instructions and pinout
- (Optional) a testbench for simulation

---

## 📂 Available Modules

- [UART Transmitter (uart_tx)](./uart_tx) – Serial data transmitter
- [UART Receiver (uart_rx)](./uart_rx) – Serial data receiver
- (More modules coming soon...)

---

## 📦 Using with VPM (Verilog Package Manager)

If you are using [VPM](https://github.com/getinstachip/vpm), you can include these modules directly in your project.  
For example, to add the UART transmitter:

```bash
vpm include https://github.com/<your-username>/<repo-name>/uart_tx
