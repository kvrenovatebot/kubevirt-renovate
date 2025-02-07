FROM ghcr.io/renovatebot/renovate

ARG BAZEL_VERSION=5.4.1

USER 0
# https://bazel.build/install/ubuntu
RUN apt install apt-transport-https curl gnupg -y && \
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg && \
mv bazel-archive-keyring.gpg /usr/share/keyrings && \
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
apt update && apt install bazel-$BAZEL_VERSION && ln -s /usr/bin/bazel-$BAZEL_VERSION /usr/bin/bazel

#RUN apt update && apt install -y make podman uidmap slirp4netns
#RUN usermod --del-subuids 100000-165536 ubuntu && usermod --add-subuids 100000-132768 ubuntu
#RUN systemctl enable docker

# https://github.com/renovatebot/renovate/blob/main/tools/docker/Dockerfile
USER 12021
WORKDIR /usr/src/app
ENTRYPOINT ["/usr/local/sbin/renovate-entrypoint.sh"]
CMD ["renovate"]
