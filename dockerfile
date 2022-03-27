
FROM dock.mau.dev/maubot/maubot:standalone
ENV PYTHONPATH="/opt/maubot:/translate"
RUN apk add git
RUN git clone https://github.com/motey/translate.git /translate && cd /translate && git fetch && git checkout feat/regex-match-room-config
ENV UID=1337 \
    GID=1337
RUN mkdir /data
RUN mkdir /config
COPY translator-docker/config.yaml /template/config.yaml
COPY translator-docker/run.sh /usr/bin/run.sh 
#COPY --from=builder /translate/translate.maubot.mbp /plugins/translate.mbp
#COPY --from=builder /translate/maubot.yaml /plugins/maubot.yaml
CMD ["/usr/bin/run.sh"]
