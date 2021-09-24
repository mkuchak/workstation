# Workstation

Ubuntu 21.04 LTS, Htop, Nano, Curl, ZSH, Git, Sugar Git, GitHub CLI, Node 16.x, Npm 7.x and Yarn

## Docker Commands
```bash
# Build this image
docker build -t mkuchak/workstation:latest .

# Publish this image
docker login
docker push mkuchak/workstation:latest

# Create a container based on this image
docker run -it --init --name workstation \
  -v ~/Workspaces:/home/Workspaces \
  --network host \
  --restart=unless-stopped \
  -d mkuchak/workstation bash

# Run this container in terminal
docker exec -it workstation bash

# Delete container
docker rm -fv workstation

# Delete this builded image
docker rmi -f mkuchak/workstation:latest
```

## Shortcut tip

Add this alias to the end of `~/.bashrc` or `~/.zshrc` and restart the terminal

```bash
alias ws="docker exec -it workstation bash"
```

Type `ws` in the terminal to log into your workstation and use [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) to programming with VSCode