FROM python:2.7.14
LABEL maintainer="plateformemia@lemonde.fr"

RUN set -x \
    && apt-get update \
    && apt-get install -y \
    ca-certificates=20141019+deb8u3 \
       --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /
COPY requirements.txt /

RUN pip install -r /requirements.txt

EXPOSE 5557 5558 8089

RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
