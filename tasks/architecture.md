
---

# 🏗️ Tuning Architecture

> Overview of all tuning layers in this setup, from hardware to client.

The diagram below shows every level of tuning applied in this configuration:

![architecture](../images/architecture.jpg)

---

### 📊 Tuning Levels

The image illustrates how tuning is applied across the full stack:

| Level | Description |
|-------|-------------|
| **Hardware** | Peripherals and components (see [Peripherals](peripherals.md)) |
| **Kernel** | Custom compiled kernel (see [Kernel](kernel.md)) |
| **Scheduler** | CPU scheduling configuration (see [Scheduler](scheduler.md)) |
| **GPU** | Radeon driver and tuning (see [Radeon](radeon.md)) |
| **Environment** | Gamemode and Gamescope (see [Gamemode](gamemode.md), [Gamescope](gamescope.md)) |
| **Client** | unezquake build (see [unezquake](unezquake.md)) |

---

> 💡 **Note:** Each layer can be applied independently — see the [main page](../README.md) for the full setup overview.

---
