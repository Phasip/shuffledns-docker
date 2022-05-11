FROM golang:1.17-alpine
COPY --from=phasip/massdns:latest /massdns/bin/massdns /usr/bin/massdns
ADD https://raw.githubusercontent.com/assetnote/commonspeak2-wordlists/master/subdomains/subdomains.txt /subdomains.txt
RUN GO111MODULE=on go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@master
RUN apk add coreutils
ADD online_resolver_shuffledns.sh /online_resolver_shuffledns.sh
ENTRYPOINT ["/online_resolver_shuffledns.sh"]
