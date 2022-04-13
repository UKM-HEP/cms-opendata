MAINTAINER Siewyan Hoh <shoh@ukm.edu.my>
FROM cmsopendata/cmssw_5_3_32-slc6_amd64_gcc472
RUN yum update -y && yum install -y htop emacs
RUN mkdir -p /home/user/cmsusr/.ssh
COPY ssh_shared /home/user/.ssh
RUN chown -R cmsusr:cmsusr /home/user/cmsusr/.ssh
CMD ["/bin/bash"]