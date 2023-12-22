FROM python:3.8-alpine
WORKDIR /Techlanders_ecom/ekart
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install 
EXPOSE 5000
CMD ["flask", "run"]
