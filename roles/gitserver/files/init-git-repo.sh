#! /usr/bin/env bash

# Usage examples
#
# Init private repository and mirror it to github.
# ./init-git-repo.sh --private --mirror repo.git

private=0
mirror=0
repo=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -p|--private)
            private=1
            shift
            ;;
        -m|--mirror)
            mirror=1
            shift
            ;;
    -*|--*)
      echo "Unknown option $1" 1>&2
      exit 1
      ;;
    *)
      repo=$1
      shift
      ;;
  esac
done

if [ -z $repo ]; then
    echo "Provide repository name!" 1>&2
    exit 1
fi

mkdir $repo
cd $repo
git init --bare

if [ $private -eq 0 ]; then
    touch git-daemon-export-ok
fi

if [ $mirror -eq 1 ]; then
    git remote add --mirror github git@github.com:ilvokhin/$repo

    cat > hooks/post-receive <<EOF
#! /bin/sh

git push --quiet github &
EOF

    chmod +x hooks/post-receive
fi

cd ..
