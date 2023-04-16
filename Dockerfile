# Dockerfile

FROM python:3.9-buster

# install nginx
RUN apt-get update && apt-get install nginx vim -y --no-install-recommends
COPY nginx.default /etc/nginx/sites-available/default
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# copy source and install dependencies
RUN mkdir -p /opt/app
RUN mkdir -p /opt/app/ecommerce
COPY requirements.txt start-server.sh /opt/app/
COPY . /opt/app/ecommerce/
WORKDIR /opt/app/ecommerce/
RUN pip install -r requirements.txt
RUN python manage.py collectstatic
RUN python manage.py makemigrations
RUN python manage.py migrate 
RUN chown -R www-data:www-data /opt/app

# start server
EXPOSE 8020
STOPSIGNAL SIGTERM
RUN chmod +x start-server.sh
CMD ["/opt/app/start-server.sh"]