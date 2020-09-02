FROM ubuntu:18.04
WORKDIR /ardupilot

RUN useradd -U -m ardupilot --uid 1001 --shell /bin/bash && \
    usermod -G users ardupilot

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install --no-install-recommends -y \
    lsb-release \
    sudo \
    wget \
    software-properties-common

# Create non root user for pip
ENV USER=ardupilot

RUN echo "ardupilot ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ardupilot
RUN chmod 0440 /etc/sudoers.d/ardupilot
RUN groupadd docker && usermod -a -G docker ardupilot

RUN chown -R ardupilot:ardupilot /ardupilot

USER ardupilot

ENV SKIP_AP_EXT_ENV=1 SKIP_AP_GRAPHIC_ENV=1 SKIP_AP_GIT_CHECK=1 SKIP_AP_COMPLETION_ENV=1
RUN mkdir -p /ardupilot/Tools/environment_install/ && cd /ardupilot/Tools/environment_install/ && wget https://raw.githubusercontent.com/khancyr/ardupilot/ga/Tools/environment_install/install-prereqs-ubuntu.sh && sudo chmod +x install-prereqs-ubuntu.sh && ./install-prereqs-ubuntu.sh -y

# Check that local/bin are in PATH for pip --user installed package
RUN echo "if [ -d \"\$HOME/.local/bin\" ] ; then\nPATH=\"\$HOME/.local/bin:\$PATH\"\nfi" >> ~/.bashrc

# Set the buildlogs directory into /tmp as other directory aren't accessible
ENV BUILDLOGS=/tmp/buildlogs

# Cleanup
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV CCACHE_MAXSIZE=1G
ENV PATH "$PATH"
