# Base Verilog Modules Library

This repository contains a collection of reusable Verilog modules commonly used in digital design projects.  
Each module is located in its own folder with:
- The Verilog source file (`.v`)
- A README with usage instructions and pinout

---

## 📂 Available Modules

- [Clock divider](https://github.com/Morris-Cheng/Base-Modules/tree/main/Clock_divider_module) - Clock divider
- [Delay timer](https://github.com/Morris-Cheng/Base-Modules/tree/main/Delay_timer_module) - Delay timer
- [Pulse Generator](https://github.com/Morris-Cheng/Base-Modules/tree/main/Delay_timer_module) - Pulse Generator
- [UART Receiver (uart_rx)](https://github.com/Morris-Cheng/Base-Modules/tree/main/UART_rx_module) – Serial data receiver
- [UART Transmitter (uart_tx)](https://github.com/Morris-Cheng/Base-Modules/tree/main/UART_tx_module) – Serial data transmitter
- (More modules coming soon...)

---

## 📦 Using with VPM (Verilog Package Manager)

If you are using [VPM](https://github.com/getinstachip/vpm), you can include these modules directly in your project.  
For example, to add the UART transmitter:

```bash
vpm include https://github.com/<your-username>/<repo-name>/uart_tx

Please refer to the included GitHub link for more detailed commands.
