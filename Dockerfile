# FROM opensecurity/mobile-security-framework-mobsf:v3.4.3
FROM opensecurity/mobile-security-framework-mobsf:v3.9.7

CMD ["/bin/echo", "Hello 1"]

LABEL version="1.7.2"
LABEL repository="https://github.com/fundacaocerti/mobsf-action"
LABEL homepage="https://github.com/fundacaocerti/mobsf-action"
LABEL maintainer="Ian Koerich Maciel <inm@certi.org.br>"

LABEL com.github.actions.name="GitHub Action for MobSF"
LABEL com.github.actions.description="Wraps the MobSF docker to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

USER root
RUN apt-get update -y && \
  apt-get install -y openjdk-8-jdk && \
  apt-get install -y curl jq

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# # USER mobsf
COPY LICENSE README.md /
COPY "entrypoint.sh" "/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"

ENTRYPOINT ["/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"]
CMD ["--help"]
