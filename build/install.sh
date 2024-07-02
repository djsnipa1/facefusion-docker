#!/usr/bin/env bash
set -e

# Install micromamba (conda replacement)
mkdir -p /opt/micromamba
cd /opt/micromamba
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
ln -s /opt/micromamba/bin/micromamba /usr/local/bin/micromamba
/opt/micromamba/bin/micromamba shell init -s bash -p ~/micromamba
/opt/micromamba/bin/micromamba config append channels conda-forge
eval "$(micromamba shell hook --shell bash)"
micromamba activate
micromamba create --name facefusion python=3.10

# Clone the git repo of FaceFusion and set version
git clone https://github.com/facefusion/facefusion.git
cd /facefusion
git checkout ${FACEFUSION_VERSION}

# Install torch
#eval "$(micromamba shell hook --shell bash)"
micromamba activate facefusion
${TORCH_COMMAND}

# Install the dependencies for FaceFusion
python3 install.py --onnxruntime cuda-${FACEFUSION_CUDA_VERSION}
micromamba deactivate
