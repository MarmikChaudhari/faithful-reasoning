echo "Updating system packages..."
apt update && apt upgrade -y

pip install wheel
apt install wget -y
wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
apt update
apt-get -y install cuda-toolkit-12-8

echo "Installing PyTorch..."
pip3 install torch==2.4.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

echo "Installing Python dependencies..."
pip3 install kaleido transformers tqdm pandas numpy accelerate jupyter ipywidgets widgetsnbextension pandas-profiling

export CUDA_HOME=/usr/local/cuda
export PATH=$PATH:$CUDA_HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64

pip3 install flash-attn --no-build-isolation

pip3 install plotly matplotlib scikit-learn

echo "All dependencies installed successfully!"