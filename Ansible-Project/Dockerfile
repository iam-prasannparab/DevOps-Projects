   FROM tomcat:10.1-jdk21

   # Restore the default sample apps from webapps.dist
   RUN cp -R webapps.dist/. webapps/

   # Add the .war built by Jenkins
   COPY hello-app.war /usr/local/tomcat/webapps/