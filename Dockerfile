FROM bgruening/galaxy-stable
MAINTAINER Xavier Garnier <xavier.garnier@irisa.fr>

WORKDIR /galaxy-central

# USER galaxy

# Custom welcome page
ADD welcome.html $GALAXY_CONFIG_DIR/web/welcome.html
ADD welcome_image.png $GALAXY_CONFIG_DIR/web/welcome_image.png

# Add the tool config file
ADD tool_conf.xml /etc/config/askomics_tool_conf.xml

# Add the config file to the path
ENV GALAXY_CONFIG_TOOL_CONFIG_FILE /galaxy-central/config/tool_conf.xml.sample,/galaxy-central/config/shed_tool_conf.xml,/etc/config/askomics_tool_conf.xml

# Add the tool wrapper
RUN mkdir tools/askomics
ADD askomics_wrapper/askomics.xml tools/askomics/askomics.xml
ADD askomics_wrapper/macros.xml tools/askomics/macros.xml
