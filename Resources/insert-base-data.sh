#!/bin/sh

#echo $PWD
echo "[ INFO ] Running: insert-base-data.sh"
echo "[ INFO ] Dropping & re-creating SQLite tables"
echo "[ INFO ] Populating database with base data..."

BASEDIR=$(dirname "$0")
sqlite3 "$BASEDIR/skate-budapest.sqlite" < "$BASEDIR/skate-budapest.sql"
