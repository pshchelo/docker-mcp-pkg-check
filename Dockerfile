FROM ubuntu:xenial
COPY mcp-repos.list /etc/apt/sources.list.d/mcp-repos.list
ADD http://mirror.mirantis.com/testing/openstack-pike/xenial/archive-pike.key /tmp/mcp.gpg
RUN apt-key add /tmp/mcp.gpg
ENTRYPOINT ["/bin/sh", "/opt/listpkgs.sh"]
ADD ./listpkgs.sh /opt/listpkgs.sh
