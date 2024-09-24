FROM python:3.7.10-alpine

WORKDIR /backend

COPY . . 

RUN apk add --no-cache gcc musl-dev linux-headers

RUN pip3 install -r src/requirements.txt 

CMD ["python3", "src/hello.py"]

