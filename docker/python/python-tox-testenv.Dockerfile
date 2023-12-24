FROM python:3.11.6
RUN apt update && apt upgrade -y
RUN apt-get update && apt-get upgrade -y

RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
RUN cd ~/.pyenv && src/configure && make -C src
ENV PYENV_ROOT=/root/.pyenv
ENV PATH="$PYENV_ROOT/bin:$PATH"
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc

RUN apt install clang -y
ENV CC=clang

RUN set -e; pyenv install -v 3.6.2 & \
    pyenv install -v 3.7.0 & \
    pyenv install -v 3.8.0 & \
    pyenv install -v 3.9.0 & \
    pyenv install -v 3.10.0 & \
    pyenv install -v 3.11.0 & \
    wait
RUN python -m pip install tox pytest pysocks pyvim httpx ipython

RUN ln -s /root/.pyenv/versions/3.6.2/bin/python /usr/local/bin/py362
RUN ln -s /root/.pyenv/versions/3.6.2/bin/python /usr/local/bin/py3.6.2
RUN ln -s /root/.pyenv/versions/3.7.0/bin/python /usr/local/bin/py37
RUN ln -s /root/.pyenv/versions/3.7.0/bin/python /usr/local/bin/py3.7.0
RUN ln -s /root/.pyenv/versions/3.8.0/bin/python /usr/local/bin/py38
RUN ln -s /root/.pyenv/versions/3.8.0/bin/python /usr/local/bin/py3.8.0
RUN ln -s /root/.pyenv/versions/3.9.0/bin/python /usr/local/bin/py39
RUN ln -s /root/.pyenv/versions/3.9.0/bin/python /usr/local/bin/py3.9.0
RUN ln -s /root/.pyenv/versions/3.10.0/bin/python /usr/local/bin/py310
RUN ln -s /root/.pyenv/versions/3.10.0/bin/python /usr/local/bin/py3.10.0
RUN ln -s /root/.pyenv/versions/3.11.0/bin/python /usr/local/bin/py311
RUN ln -s /root/.pyenv/versions/3.11.0/bin/python /usr/local/bin/py3.11.0
RUN ln -s /usr/local/bin/python3.11 /usr/local/bin/py3.11.6

RUN apt-get install gh -y

CMD bash
