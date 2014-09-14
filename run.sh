#!/bin/sh
set -e

exec supervisord -c /etc/supervisor/supervisord.conf
