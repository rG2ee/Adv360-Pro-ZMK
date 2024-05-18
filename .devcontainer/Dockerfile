FROM mcr.microsoft.com/devcontainers/base:debian


ARG GIT_USER
ARG GIT_EMAIL


# dependencies for pyenv
RUN sudo apt update && sudo apt install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    curl \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev

# other dependencies
RUN sudo apt install -y \
    zsh \
    git \
    vim

#######################################################################################################
#########################        Configure User 'user'     ############################################
#######################################################################################################
# move vscode to another id
RUN groupmod --gid 1002 vscode
RUN usermod --uid 1002 --gid 1002 vscode

# add the user with proper ids
RUN groupadd --gid 1000 user
RUN useradd --uid 1000 --gid 1000 -m -s /bin/zsh user
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set the default user
USER user
WORKDIR /home/user

#######################################################################################################
###############################  install ohmyzsh     ##################################################
#######################################################################################################
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



#######################################################################################################
###############################  install awesome-vim     ##############################################
#######################################################################################################

RUN git clone --depth=1 https://github.com/amix/vimrc.git /home/user/.vim_runtime
RUN sh /home/user/.vim_runtime/install_awesome_vimrc.sh

#######################################################################################################

#######################################################################################################
#########################  install and configure pyenv     ############################################
#######################################################################################################


# Installieren Sie pyenv
RUN curl https://pyenv.run | bash

# add to BASH
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
RUN echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(pyenv init -)"' >> ~/.bash_profile


# add to ZSH
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
RUN echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.zshrc

#######################################################################################################
#########################  set up python and poety    #################################################
#######################################################################################################
ENV HOME  /home/user
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

#
RUN pyenv install 3.12.3
RUN pyenv global 3.12.3

RUN curl -sSL https://install.python-poetry.org | python3 -

#######################################################################################################
#########################  configure git    #################################################
#######################################################################################################

RUN git config --global user.name "$GIT_USER"
RUN git config --global user.email "$GIT_EMAIL"


#######################################################################################################
#########################  handle tailscale           #################################################
#######################################################################################################
RUN curl -fsSL https://tailscale.com/install.sh | sh
RUN printf "# Starting Tailscale daemon automatically if not running...\n\
RUNNING=\`ps aux | grep tailscaled | grep -v grep\`\n\
STARTED_IN_THIS_SHELL=No\n\
if [ -z \"\$RUNNING\" ]; then\n\
  sudo tailscaled > /dev/null 2>&1 &\n\
  STARTED_IN_THIS_SHELL=Yes\n\
  disown\n\
fi\n" >> /home/user/.bashrc


RUN printf "# Starting Tailscale daemon automatically if not running...\n\
RUNNING=\`ps aux | grep tailscaled | grep -v grep\`\n\
STARTED_IN_THIS_SHELL=No\n\
if [ -z \"\$RUNNING\" ]; then\n\
  sudo tailscaled > /dev/null 2>&1 &\n\
  STARTED_IN_THIS_SHELL=Yes\n\
  disown\n\
fi\n" >> /home/user/.zshrc

####################################################################################################### \

COPY postCreateCommand.sh /home/user/postCreateCommand.sh
