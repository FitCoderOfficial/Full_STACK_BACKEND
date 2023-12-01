FROM python:3.11
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY . /app/

EXPOSE 8000

# CMD python manage.py runserver 0.0.0.0:8000

# Collect static files
RUN python manage.py collectstatic --no-input
# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi:application"]