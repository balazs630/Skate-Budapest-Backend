#!/bin/sh

BASEDIR=$(dirname "$0")
sqlite3 skate-budapest.db < "$BASEDIR/skate-budapest.sql"
