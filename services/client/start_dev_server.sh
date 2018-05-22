#!/usr/bin/env bash

gnome-terminal -e 'npm test'
export REACT_APP_USERS_SERVICE_URL=http://127.0.0.1
npm start
