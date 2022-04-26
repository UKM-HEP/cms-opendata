FROM cmsopendata/cmssw_5_3_32-slc6_amd64_gcc472
MAINTAINER Siewyan Hoh <shoh@ukm.edu.my>

USER root
RUN echo alias nemacs=\"emacs -nw\" >> /home/cmsusr/.bashrc
RUN echo alias iamboss=\"chown -R cmsusr:cmsusr\" >> /home/cmsusr/.bashrc
USER cmsusr
ENTRYPOINT []
CMD []
CMD ["/bin/bash"]