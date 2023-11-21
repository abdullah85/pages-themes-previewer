echo "Building Time machine ..."
cd time-machine;
bundle exec jekyll build;

echo "Building Tactile Theme ..."
cd ../tactile;
bundle exec jekyll build;
