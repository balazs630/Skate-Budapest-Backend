#!/bin/sh

#echo $PWD
echo "[ INFO ] Running: insert-base-data.sh"
echo "[ INFO ] Dropping & re-creating SQLite tables"
echo "[ INFO ] Populating database with base data..."

BASEDIR=$(dirname "$0")
sqlite3 skate-budapest.db < "$BASEDIR/skate-budapest.sql"
