FROM node:20-bullseye

# Install system tools
RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    python3-pip \
    curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install n8n
RUN npm install -g n8n

# Install yt-dlp
RUN pip3 install --no-cache-dir yt-dlp

# Create n8n user
RUN useradd -ms /bin/bash n8n

USER n8n

WORKDIR /home/n8n

EXPOSE 5678

CMD ["n8n"]
