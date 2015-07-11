install_node_modules() {
  local build_dir=${1:-}

  if [ -e $build_dir/package.json ]; then
    cd $build_dir
    echo "Pruning any extraneous modules"
    npm prune --unsafe-perm --userconfig $build_dir/.npmrc 2>&1
    if [ -e $build_dir/npm-shrinkwrap.json ]; then
      echo "Installing node modules (package.json + shrinkwrap)"
    else
      echo "Installing node modules (package.json)"
    fi
    npm install --unsafe-perm --userconfig $build_dir/.npmrc 2>&1
  else
    echo "Skipping (no package.json)"
  fi
}

rebuild_node_modules() {
  local build_dir=${1:-}

  if [ -e $build_dir/package.json ]; then
    cd $build_dir
    echo "Rebuilding any native modules"
    npm rebuild 2>&1
    if [ -e $build_dir/npm-shrinkwrap.json ]; then
      echo "Installing any new modules (package.json + shrinkwrap)"
    else
      echo "Installing any new modules (package.json)"
    fi
    npm install --unsafe-perm --userconfig $build_dir/.npmrc 2>&1
  else
    echo "Skipping (no package.json)"
  fi
}

install_bower_modules() {
  local build_dir=${1:-}

  if [ -e $build_dir/bower.json ]; then
    # Install bower locally
    npm install bower
    echo "-----> Found bower.json, running bower install"
    $build_dir/node_modules/.bin/bower install
  else
    echo "-----> Skipping (no bower.json)"
  fi
}

run_gulp_script() {
  local build_dir=${1:-}
  local node_env=${2:-}

  if [ -e $build_dir/gulpfile.js ] || [ -e $build_dir/gulpfile.coffee ]; then

    # Install gulp locally
    npm install gulp
    echo "-----> Found gulpfile, running gulp heroku:$node_env task"
    $build_dir/node_modules/.bin/gulp heroku:$node_env
  else
    echo "-----> No gulpfile found"
  fi
}