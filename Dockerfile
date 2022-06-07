FROM osgeo/gdal:alpine-normal-latest
LABEL version="1.0"

# ENV PYTHONUNBUFFERED 1
# ENV PROJ_DIR=/usr

# Copy requirement file
COPY ./requirements.txt /requirements.txt

RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache  --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev \
      libffi-dev libjpeg libwebp  \
      openjpeg libimagequant libxcb python3-dev openssl-dev cargo \
      #Add other things
      && apk --no-cache add build-base \
      # python-dev \
      py-pip \
      # Pillow depenencies
      jpeg-dev \
      zlib-dev \
      freetype-dev \
      lcms2-dev \
      openjpeg-dev \
      tiff-dev \
      tk-dev \
      tcl-dev \
      && python -m pip install --upgrade pip \
      && pip install -r /requirements.txt \
      && apk del .tmp-build-deps

# Setup directory structure to store our source code
RUN mkdir /buildings
WORKDIR /buildings
COPY ./buildings/ /buildings

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol/
RUN chmod -R 755 /vol/web
USER user