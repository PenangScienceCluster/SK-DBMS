FROM ubuntu:20.04

# Avoid terminal hanging at interactive questions
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt update
RUN apt install -y sudo libglib2.0-bin gsettings-desktop-schemas keyboard-configuration wget

# Configure user
RUN groupadd -r dialout || true
RUN useradd -ms /bin/bash psc
RUN usermod -aG sudo psc
RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set user
USER psc
WORKDIR /home/psc

CMD ["bash"]
