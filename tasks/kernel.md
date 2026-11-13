

# 🎮 Installing a Custom Gaming Kernel (Ubuntu)

> ⚠️ **Before you start:** Be aware that kernel compilation is time-consuming and memory-intensive. This guide uses LLVM Clang as the compiler.

---

## 📦 Step 1 — Install the Latest LLVM Clang Compiler

Add the LLVM APT repository to `/etc/apt/sources.list.d/`:

```bash
vi /etc/apt/sources.list.d/archive_uri-https_apt_llvm_org_resolute_-resolute.list
```

Contents of the file:

```ini
deb https://apt.llvm.org/resolute/ llvm-toolchain-resolute-23 main
# deb-src https://apt.llvm.org/resolute/ llvm-toolchain-resolute-23 main
```

Then update and install:

```bash
sudo apt update
sudo apt install clang llvm lld
```

---

## 🐧 Step 2 — Get and Compile the Kernel

We'll use [linux-tkg](https://github.com/frogging-family/linux-tkg) by Frogging Family.

```bash
git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
./install.sh install
```

### Interactive Menu Choices

Follow the prompts and select the following options:

| Prompt | Selection |
|---|---|
| Distribution | `3) Ubuntu` |
| Kernel version | `0) v7.3.4` |
| Scheduler | `eevdf` |
| Compiler | `1) Clang/LLVM` |
| Build type | `1) Full` |
| CPU optimization | `znver5` (or your CPU arch) |
| Timer frequency | `5) 1000 Hz` |
| Tick mode | `2) Just tickless idle plz` |
| Apply `nvme.myfrag`? | `y` |
| Final prompt | `0. nope` |

> 💡 **Note on `nvme.myfrag`:** This config fragment is required to boot the kernel from an NVMe disk.

### The `nvme.myfrag` file

```ini
CONFIG_BLK_DEV_NVME=y
CONFIG_NVME_CORE=y
```

---

## 🔁 Step 3 — Reboot and Verify

```bash
reboot
uname -a
```

You should see the newly compiled kernel listed in the output. 🎉

---
I can't modify files in the GitHub repository directly, but here's the exact text you should add as **Step 4** (and the updated checklist entry). You can paste this into `tasks/kernel.md` after Step 3:

---

## ⚡ Step 4 — Disable Kernel Mitigations via GRUB

To squeeze out extra gaming performance, disable CPU vulnerability mitigations by adding `mitigations=off` to the kernel command line.

Edit `/etc/default/grub`:

```bash
sudo vi /etc/default/grub
```

Find the `GRUB_CMDLINE_LINUX_DEFAULT` line and add `mitigations=off` inside the quotes:

```ini
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash mitigations=off"
```

> 💡 **Note:** Keep whatever options are already there (e.g. `quiet splash`) and just append `mitigations=off`.

Apply the change and reboot:

```bash
sudo update-grub
reboot
```

Verify the option is active:

```bash
cat /proc/cmdline
```

You should see `mitigations=off` in the output. 🎉

> ⚠️ **Security warning:** Disabling mitigations removes protection against Spectre/Meltdown-class CPU vulnerabilities. Only do this on a machine you trust and understand the trade-off.

### ✅ Summary Checklist (updated)

- [ ] LLVM Clang toolchain installed
- [ ] `linux-tkg` repo cloned
- [ ] Kernel configured for gaming (1000 Hz, tickless idle, Clang)
- [ ] `nvme.myfrag` applied
- [ ] System rebooted and new kernel confirmed via `uname -a`
- [ ] `mitigations=off` added to `GRUB_CMDLINE_LINUX_DEFAULT`, `update-grub` run, and verified in `/proc/cmdline`

---
