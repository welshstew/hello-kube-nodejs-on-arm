FROM arm32v7/node:11
EXPOSE 8080
COPY server.js .
CMD node server.js
