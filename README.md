# PWN-env-for-ARM-macOS

Build instruction:

```bash
$ docker run -it --cap-add=CAP_SYS_PTRACE --security-opt seccomp=unconfined --privileged --rm --name iot-pwn --platform linux/amd64 ctf-pwn-env /bin/bash
```

