FROM himmel17/atg-cuda9.0-base:0.1
LABEL maintainer="himmel17"
LABEL title="CUDA9.0 Custom Image"
LABEL version="0.1"
LABEL description="CUDA9.0 Custom Image"

ARG user_name="tester"
ARG user_id=1001
ARG group_name="rsd"
ARG group_id=1001

ENV http_proxy=http://proxy.atg.sony.co.jp:10080/
ENV https_proxy=https://proxy.atg.sony.co.jp:10080/

# ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64:/usr/local/lib:/usr/lib:/usr/lib/x86_64-linux-gnu:/lib64:/lib

# ユーザ設定
# ユーザID,グループIDをパラメータにすることでホストボリュームに対する操作を
# ユーザ権限で実行できるようにしている．
RUN groupadd -g ${group_id} ${group_name} && \
	useradd --create-home --shell /bin/bash \
	--uid ${user_id} --gid ${group_id} --home-dir /home/${user_name} \
	${user_name}

USER ${user_name}
WORKDIR /home/${user_name}
ENV HOME /home/${user_name}
