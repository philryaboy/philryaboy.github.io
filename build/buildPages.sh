#!/bin/bash

# only proceed script when on "master" branch
if [ $TRAVIS_BRANCH != 'translation-staging' ]; then
  echo "this is not the staging branch, exiting"
  exit 0
fi

# enable error reporting to the console
set -e

## First, build for GitHub Pages
# build site with jekyll, by default to `_site' folder
rm -rf _site/*
bundle exec jekyll build --config _config.yml,build/_configPages.yml -d _site/MFPSamples --profile --verbose
rm -f _site/*.log
bundle exec htmlproofer ./_site --disable-external --url-ignore "#,/support/knowledgecenter/js/kc/globaltopic.js,/support/knowledgecenter/js/kc/themes/css/globaltopic.css" --log-level :debug

# only proceed script when started not by pull request (PR)
if [ $TRAVIS_PULL_REQUEST == "false" ]; then
  # cleanup
  rm -rf ../mfpsamples.github.ibm.com.master

  #clone `master' branch of the repository
  git clone git@github.ibm.com:MFPSamples/mfpsamples.github.ibm.com.git --depth 1 --branch master --single-branch ../mfpsamples.github.ibm.com.master
  # copy generated HTML site to `master' branch
  rm -rf ../mfpsamples.github.ibm.com.master/*
  cp -R _site/MFPSamples/* ../mfpsamples.github.ibm.com.master

  # commit and push generated content to `master' branch
  # since repository was cloned in write mode with token auth - we can push there
  cd ../mfpsamples.github.ibm.com.master
  git config user.email "nathanh@il.ibm.com"
  git config user.name "Nathan Hazout Travis"
  git add -A .
  git commit -a -m "Travis Build $TRAVIS_BUILD_NUMBER"
  git push --quiet origin master
fi
