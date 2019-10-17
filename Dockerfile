FROM alpine:latest

RUN apk add --no-cache uwsgi-python3 python3

# Setup working directory
RUN mkdir -p /app
WORKDIR /app

# Install python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Don't just blindly copy everything like a savage
COPY demoapp demoapp
COPY uwsgi.ini .

CMD ["uwsgi", "--ini", "uwsgi.ini"]

