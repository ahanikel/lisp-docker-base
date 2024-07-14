FROM alpine

RUN \
    apk update && \
    apk add sbcl && \
    apk cache clean && \
    rm -rf /var/cache/apk

RUN \
    wget https://beta.quicklisp.org/quicklisp.lisp && \
    sbcl --load quicklisp.lisp --eval '(quicklisp-quickstart:install)' && \
    rm -f quicklisp.lisp

COPY create-core-image.lisp /

RUN sbcl --load create-core-image.lisp && rm -f create-core-image.lisp

COPY sbclrc /root/.sbclrc

ENTRYPOINT [ "sbcl", "--core", "sbcl.core" ]

EXPOSE 4005
