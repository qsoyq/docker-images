FROM python:3.10.17
# TODO: upgrade base image

RUN pip install pytest-playwright

RUN playwright install
