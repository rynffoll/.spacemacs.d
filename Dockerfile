FROM spacemacs/emacs-snapshot:develop

COPY . ${UHOME}/.spacemacs.d

# Set envs
ENV TERM=xterm-256color
ENV LANG=en_US.UTF-8
ENV WORKSPACE=${UHOME}

# Install emacs packages
RUN rm ${UHOME}/.spacemacs
RUN chown spacemacser:emacs -R ${UHOME}/.spacemacs.d
RUN asEnvUser git -C ${UHOME}/.emacs.d pull
RUN sed -i "s/\(-distribution 'spacemacs\)/\1-docker/" ${UHOME}/.spacemacs.d/init.el \
    && asEnvUser emacs -batch -u ${UNAME} -kill \
    && asEnvUser emacs -batch -u ${UNAME} -kill

# Install Fira Mono
ENV FIRA_MONO_REPO="https://github.com/mozilla/Fira/raw/master/ttf"
RUN apt-get update && apt-get install wget \
    && mkdir -p /usr/local/share/fonts \
    && wget -q "${FIRA_MONO_REPO}/FiraMono-Regular.ttf" -P /usr/local/share/fonts \
    && wget -q "${FIRA_MONO_REPO}/FiraMono-Bold.ttf" -P /usr/local/share/fonts \
    && wget -q "${FIRA_MONO_REPO}/FiraMono-Medium.ttf" -P /usr/local/share/fonts \
    && fc-cache -fv \
    && apt-get purge wget \
    && rm -rf /tmp/* /var/lib/apt/lists/* /root/.cache/*
