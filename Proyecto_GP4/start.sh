#!/bin/sh

echo "Aplicando migraciones..."
python manage.py migrate --noinput

echo "Recolectando archivos estáticos..."
python manage.py collectstatic --noinput

echo "Iniciando Gunicorn..."
gunicorn Proyecto_GP4.wsgi:application --bind 0.0.0.0:${PORT:-8000}