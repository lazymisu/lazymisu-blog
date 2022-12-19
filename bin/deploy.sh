#!/bin/bash

echo "[deploy] START"

echo "[deploy] clean jekyll files"
bundle exec jekyll clean

echo "[deploy] build jekyll site"
bundle exec jekyll build

# if [[ "$1" == "-d" ]]
# then
#     echo "[deploy] delete neocities files"
#     FILES=$(bundle exec neocities list / | tr '\n' ',')
#     IFS=,
#     for FILE in $FILES
#     do
#         if [[ "$FILE" == *"."* ]]
#         then
#             bundle exec neocities delete "$FILE"
#         else
#             bundle exec neocities delete "$FILE"/
#         fi
#     done
# fi

echo "[deploy] upload to neocities"
bundle exec neocities push _site

echo "[deploy] SUCCESS!"