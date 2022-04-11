FROM ubuntu:18.04

RUN apt-get update \
    && apt -y install ruby vim git gcc make libssl-dev libreadline-dev zlib1g-dev wget

# exec $SHELL -lこれがdockerfileは使えない どうしようか
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(rbenv init -)"' >> ~/.bashrc \
    && git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build \
    && exec $SHELL -l \
    && rbenv install 2.6.2 \
    && rbenv global 2.6.2

RUN gem install rails -v "6.0.0"

RUN mkdir app

WORKDIR /app