# Workstation

Ubuntu 21.04 LTS, Htop, Nano, Curl, ZSH, Git, Sugar Git, GitHub CLI, Node 16.x, Npm 7.x and Yarn.

## Docker Commands
```bash
# Build this image
docker build -t workstation .

# Create a container based on this image
docker run -it --init --name workstation \
  -v ~/Workspaces:/home/Workspaces \
  --network host \
  --restart=unless-stopped \
  -d workstation bash

# Run this container in terminal
docker exec -it workstation bash

# Delete container
docker rm -fv workstation

# Delete this builded image
docker rmi -f workstation
```