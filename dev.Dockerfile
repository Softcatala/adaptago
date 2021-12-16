FROM debian:unstable-slim AS sed

ADD https://raw.githubusercontent.com/Softcatala/adaptadorvariants/master/tools/src2valencia.sed src2valencia.sed
RUN sed -e 's/\\(/\(/g' -e 's/\\|/\|/g' -e  's/\\)/\)/g' -e 's/\\1/${1}/g' -e 's/\\2/${2}/g' -e 's/\\3/${3}/g' -e 's/\\4/${4}/g' -i  src2valencia.sed

