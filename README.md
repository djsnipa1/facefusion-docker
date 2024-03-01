# Docker image for FaceFusion: Next generation face swapper and enhancer

## Installs

* Ubuntu 22.04 LTS
* CUDA 11.8
* Python 3.10.12
* [FaceFusion](
  https://github.com/facefusion/facefusion) 2.3.0
* Torch 2.1.2
* Jupyter Lab
* [runpodctl](https://github.com/runpod/runpodctl)
* [OhMyRunPod](https://github.com/kodxana/OhMyRunPod)
* [RunPod File Uploader](https://github.com/kodxana/RunPod-FilleUploader)
* [croc](https://github.com/schollz/croc)
* [rclone](https://rclone.org/)
* screen
* tmux

## Available on RunPod

This image is designed to work on [RunPod](https://runpod.io?ref=2xxro4sy).
You can use my custom [RunPod template](
https://runpod.io/gsc?template=pxpldkhq6u&ref=2xxro4sy)
to launch it on RunPod.

## Running Locally

### Install Nvidia CUDA Driver

- [Linux](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html)
- [Windows](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html)

### Start the Docker container

```bash
docker run -d \
  --gpus all \
  -v /workspace \
  -p 3000:3001 \
  -p 8888:8888 \
  -p 2999:2999 \
  -e VENV_PATH="/workspace/venvs/facefusion" \
  ashleykza/facefusion:latest
```

You can obviously substitute the image name and tag with your own.

### Ports

| Connect Port | Internal Port | Description          |
|--------------|---------------|----------------------|
| 3000         | 3001          | FaceFusion           |
| 8888         | 8888          | Jupyter Lab          |
| 2999         | 2999          | RunPod File Uploader |

### Environment Variables

| Variable           | Description                                  | Default                          |
|--------------------|----------------------------------------------|----------------------------------|
| VENV_PATH          | Set the path for the Python venv for the app | /workspace/venvs/audiocraft_plus |
| DISABLE_AUTOLAUNCH | Disable Forge from launching automatically   | (not set)                        |

## Logs

FaceFusion creates a log file, and you can tail the log instead of
killing the service to view the logs.

| Application | Log file                       |
|-------------|--------------------------------|
| FaceFusion  | /workspace/logs/facefusion.log |

For example:

```bash
tail -f /workspace/logs/facefusion.log
```

## Community and Contributing

Pull requests and issues on [GitHub](https://github.com/ashleykleynhans/facefusion-docker)
are welcome. Bug fixes and new features are encouraged.

You can contact me and get help with deploying your container
to RunPod on the RunPod Discord Server below,
my username is **ashleyk**.

<a target="_blank" href="https://discord.gg/pJ3P2DbUUq">![Discord Banner 2](https://discordapp.com/api/guilds/912829806415085598/widget.png?style=banner2)</a>

## Appreciate my work?

<a href="https://www.buymeacoffee.com/ashleyk" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
