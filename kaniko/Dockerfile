FROM alpine
RUN apk --no-cache add python3
RUN echo "Built with kaniko on $(date)" > /message.txt
ADD helloworld.py /usr/local/bin/
RUN apk --no-cache add bash
RUN chmod +x /usr/local/bin/*
ENTRYPOINT ["/usr/local/bin/helloworld.py"]

