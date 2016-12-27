FROM simonsimcity/bitbucket-meteor

USER root

RUN apt-get update

# Install all the packages for chromium on a virtual desktop
RUN apt-get install -y xvfb chromium-browser default-jre

RUN apt-get clean

# Copied from https://github.com/mark-adams/docker-chromium-xvfb
ADD no-sandbox-chromium /usr/bin/no-sandbox-chromium
RUN chmod +x /usr/bin/no-sandbox-chromium
RUN ln -s /usr/bin/no-sandbox-chromium /usr/local/bin/google-chrome
RUN ln -s /usr/bin/no-sandbox-chromium /usr/local/bin/chromium-browser

# Switch user back to meteor
USER meteor
