# SCM-Manager (scm-server)
#
FROM amouat/revealjs:latest
MAINTAINER Niko Mahle <niko.mahle@googlemail.com>

COPY slides.md /revealjs/md/slides.md
COPY images /revealjs/images
COPY custom.css /revealjs/md/custom.css

EXPOSE 8000 35729
CMD ["grunt", "serve"]