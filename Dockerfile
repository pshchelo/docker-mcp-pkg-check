FROM ubuntu:xenial

RUN echo 'apt-get -qq update && apt-cache policy $@' > /opt/listpkgs.sh

ADD http://apt.mirantis.com/public.gpg /tmp/apt.mirantis.com.gpg
RUN apt-key add /tmp/apt.mirantis.com.gpg

ADD http://mirror.mirantis.com/nightly/openstack-pike/xenial/archive-pike.key /tmp/nightly-mmc.gpg
RUN apt-key add /tmp/nightly-mmc.gpg

ADD http://mirror.mirantis.com/testing/openstack-pike/xenial/archive-pike.key /tmp/testing-mmc.gpg
RUN apt-key add /tmp/testing-mmc.gpg

ADD http://mirror.mirantis.com/2018.8.0/openstack-pike/xenial/archive-pike.key /tmp/release-mmc.gpg
RUN apt-key add /tmp/release-mmc.gpg

COPY mcp-tagged.list /etc/apt/sources.list.d/mcp-tagged.list
RUN apt-get -qq update

COPY mcp-repos.list /etc/apt/sources.list.d/mcp-repos.list

ENTRYPOINT ["/bin/sh", "/opt/listpkgs.sh"]
