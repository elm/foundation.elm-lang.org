#!/bin/bash

set -e



## MAKE PAGE HTML


# ARGS:
#   $1 = _site/NAME.html
#   $2 = <title>
#   $3 = uglifyjs stdout
#
function makeHtml {
  cat <<EOF > $1
<!DOCTYPE HTML>
<html>

<head>
  <meta charset="UTF-8">
  <title>$2</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans">
  <link rel="stylesheet" href="style.css">
  <meta name="viewport" content="width=device-width">
  <link rel="icon" type="image/png" href="/heart.png">
</head>

<body>

<script type="text/javascript">
$(cat $3)
var app = Elm.Main.init();
</script>

</body>
</html>
EOF

}



## DOWNLOAD BINARIES

PATH=$(pwd)/node_modules/.bin:$PATH

if ! [ -x "$(command -v elm)" ]; then
  npm install elm@latest-0.19.1
fi
if ! [ -x "$(command -v uglifyjs)" ]; then
  npm install uglify-js
fi


## GENERATE HTML


mkdir -p _site
mkdir -p _temp

## static

cp -r static/* _site/

## pages

echo "PAGES"
for elm in $(find pages -type f -name "*.elm")
do
    subpath="${elm#pages/}"
    name="${subpath%.elm}"
    js="_temp/$name.js"
    html="_site/$name.html"

    if [ -f $html ] && [ $(date -r $elm +%s) -le $(date -r $html +%s) ]; then
        echo "Cached: $elm"
    else
        echo "Compiling: $elm"
        mkdir -p $(dirname $js)
        mkdir -p $(dirname $html)
        rm -f elm-stuff/*/Main.elm*
        elm make $elm --optimize --output=$js > /dev/null
        uglifyjs $js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' \
          | uglifyjs --mangle \
          | makeHtml $html $name
    fi
done


## REMOVE TEMP FILES

rm -rf _temp
