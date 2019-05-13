FROM sameersbn/redmine:3.4.10-1

COPY patch/ /tmp/
RUN find /tmp/ -maxdepth 1 -type f -name '*.patch' \
    | sort \
    | xargs -i{} bash -c 'patch -p1 < {}' \
    && rm /tmp/*.patch
