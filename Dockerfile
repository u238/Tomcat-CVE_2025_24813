FROM tomcat:11.0.2

RUN sed '0,/<\/init-param>/{s|</init-param>|</init-param><init-param><param-name>readonly</param-name><param-value>false</param-value></init-param>|}' -i conf/web.xml
RUN sed '0,/<\/Context>/{s|<\/Context>|<Manager className="org.apache.catalina.session.PersistentManager"><Store className="org.apache.catalina.session.FileStore"/><\/Manager><\/Context>|}' -i conf/context.xml
COPY ROOT.war webapps/
