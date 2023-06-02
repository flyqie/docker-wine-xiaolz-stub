# Docker do not have UNEXPOSE :(
FROM flyqie/docker-wine-xiaolz AS original
FROM scratch
COPY --from=original / /

VOLUME ["/home/user/xiaolz"]

ENV LANG=zh_CN.GBK \
	LC_ALL=zh_CN.GBK \
	TZ=Asia/Shanghai \
	XIAOLZ_URL='https://api.ooomn.com/api/lanzou?url=lanzoux.com%2Fi9ddC0alqzxg&type=down' \
	S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
	S6_CMD_ARG0=/sbin/entrypoint.sh \
	VNC_GEOMETRY=800x600 \
	VNC_PASSWD='MAX8char' \
	USER_PASSWD='' \
	HTTP_AUTH_USER='' \
	HTTP_AUTH_PASSWD='' \
	DEBIAN_FRONTEND=noninteractive

EXPOSE 9000/tcp
ENTRYPOINT ["/init.entrypoint"]
CMD ["start"]
