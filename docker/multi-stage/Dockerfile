FROM alpine AS stage1
ADD stage1.dat /srv
RUN ls /srv

FROM alpine AS stage2
ADD stage2.dat /srv
RUN ls /srv

FROM alpine
COPY --from=stage2 /srv/stage2.dat /srv
COPY --from=stage1 /srv/stage1.dat /srv
