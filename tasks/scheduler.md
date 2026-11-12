There is a recomended scheduler for FPS games it is lavd. So build it.

Following official instructions
#### Setting up Dev Environment

```
$ sudo apt install -y build-essential cmake cargo rustc clang llvm pkg-config libelf-dev protobuf-compiler libseccomp-dev libbpf-dev pahole
```

#### Build the scx schedulers from source

```
$ git clone https://github.com/sched-ext/scx.git
$ cd scx
$ cargo build --release
```

#### Install the scx schedulers from source

```
$ ls -d scheds/rust/scx_* | xargs -I{} cargo install --path {}
```

#### Test installation 

```
$ sudo ~/.cargo/bin/scx_lavd  --performance
```
