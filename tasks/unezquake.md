
---

# 🛠️ Compiling unezquake with CPU Optimizations

> Build a performance-tuned version of **unezquake** (client) using aggressive compiler optimizations targeted at your CPU architecture.

---

## 📥 Step 1 — Clone the Repository

```bash
git clone https://github.com/dusty-qw/unezquake.git
cd unezquake
```

---

## ⚡ Step 2 — Add Compiler Optimizations

Edit `CMakeLists.txt` and add the following compile options:

```cmake
add_compile_options(
    -march=znver5
    -mtune=znver5
    -O3
    -mavx2
    -mfma
    -ftree-vectorize
    -funroll-loops
    -flto
)
```

> 💡 **Note:** `-march=znver5` targets AMD Zen 5 CPUs. Adjust this flag to match your own CPU (e.g., `znver4`, `native`, or a specific Intel arch). The full reference file is available at `files/CMakeLists.txt`.

### Flag Breakdown

| Flag | Purpose |
|------|---------|
| `-march=znver5` | Generate code for AMD Zen 5 instruction set |
| `-mtune=znver5` | Tune scheduling/layout for Zen 5 |
| `-O3` | Maximum optimization level |
| `-mavx2` | Enable AVX2 vector instructions |
| `-mfma` | Enable Fused Multiply-Add |
| `-ftree-vectorize` | Auto-vectorize loops |
| `-funroll-loops` | Unroll loops for speed |
| `-flto` | Link-Time Optimization across translation units |

---

## 🔨 Step 3 — Configure and Build

```bash
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release   # Configuration phase
make -j $(nproc)                      # Build phase
```

---

### ✅ Summary Checklist

- [ ] `unezquake` repository cloned
- [ ] Optimization flags added to `CMakeLists.txt`
- [ ] `-march`/`-mtune` adjusted to match your CPU
- [ ] CMake configured in `Release` mode
- [ ] Build completed with `make -j $(nproc)`

---

