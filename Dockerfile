FROM alpine:edge
RUN apk --update --no-cache add go
COPY --from=phasip/massdns:latest /massdns/bin/massdns /usr/bin/massdns
ADD https://raw.githubusercontent.com/assetnote/commonspeak2-wordlists/master/subdomains/subdomains.txt /subdomains.txt
RUN GO111MODULE=on go get -u -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
ADD online_resolver_shuffledns.sh /online_resolver_shuffledns.sh
ENTRYPOINT ["/online_resolver_shuffledns.sh"]
