#!/bin/sh

#echo $PWD
echo "Running: insert-base-data.sh - Populating database with base data..."

BASEDIR=$(dirname "$0")
sqlite3 skate-budapest.db < "$BASEDIR/skate-budapest.sql"
