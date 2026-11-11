FROM tomcat:latest

# Fix for tomcat:latest empty webapps folder
RUN cp -R /usr/local/tomcat/webapps.dist/. /usr/local/tomcat/webapps/

# Copy the war file from the build context (relative path)
COPY *.war /usr/local/tomcat/webapps/
