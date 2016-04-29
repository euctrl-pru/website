require 'rake'
require 'html-proofer'



# remove generated site
def cleanup
  sh 'rm -Rf _site'
end

# launch jekyll
def jekyll(directives = '')
  sh 'bundle exec jekyll ' + directives
end

# tag
def tag()
  system("git remote add travis https://#{ENV['GH_TOKEN']}@github.com/#{ENV['TRAVIS_REPO_SLUG']}.github.io.git")
  system('git tag $GIT_TAG -a -m "Published to production from TravisCI build $TRAVIS_BUILD_NUMBER"')
  system("git push travis $GIT_TAG")
end


#############################################################################
# Development tasks
#############################################################################

# Usage: rake dev, rake dev:serve
task :dev => ["dev:serve"]
namespace :dev do

  desc "Serve development Jekyll site locally"
  task :serve do
    puts "Starting up development Jekyll site server..."
    jekyll('serve --future --config _config.yml,_config_dev.yml')
  end

  desc "Build development Jekyll site"
  task :build => :clean do
    puts "Building development Jekyll site..."
    jekyll('build --future --config _config.yml,_config_dev.yml')
  end

  desc "Check links: site needs to be running."
  task :test do
    HTMLProofer.check_directory("./_site", {
                                  :check_favicon => true,
                                  :url_ignore => ['http://localhost:4000']
                                }).run
  end

  desc 'Clean up generated site'
  task :clean do
    cleanup
  end
end


#############################################################################
# Production tasks
#############################################################################

# Usage: rake prod, rake prod:build, prod:deploy
task :prod => ["prod:build"]
namespace :prod do

  desc "Build production Jekyll site"
  task :build => :clean do
    puts "Building production Jekyll site..."
    jekyll('build --future --no-watch')
  end

  desc "Generate the site and push changes to remote origin"
  task :deploy do

    # Configure git if this is run in Travis CI, see https://github.com/openingscience/book/blob/master/Rakefile
    if ENV['TRAVIS']
      # Detect pull request
      if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
        puts 'Pull request detected. Not proceeding with deploy.'
        exit 0
      end

      puts "setting user configs ..."
      sh "git config --global user.name '#{ENV['GIT_NAME']}'"
      sh "git config --global user.email '#{ENV['GIT_EMAIL']}'"
      sh "git config --global push.default simple"

      # deploy only if on master branch eventually
      if ENV['TRAVIS_BRANCH'].to_s.scan(/^master$/).length > 0
        if ENV['TRAVIS_TAG'].to_s.to_i > 0
          puts "Not a tag, hence not deploying to github.com/#{ENV['TRAVIS_REPO_SLUG']}.github.io"
          exit 0
        else
          puts "Building and deploying tag '#{ENV['TRAVIS_TAG']}'"
          puts "Cloning #{ENV['TRAVIS_REPO_SLUG']}.github.io..."
          sh "git clone https://#{ENV['GIT_NAME']}:#{ENV['GH_TOKEN']}@github.com/#{ENV['TRAVIS_REPO_SLUG']}.github.io.git > /dev/null"

          # Generate the site...it goes in _site
          jekyll('build --future')

          # Commit and push to github
          sha = `git log`.match(/[a-z0-9]{40}/)[0]
          Dir.chdir('euctrl-pru.github.io') do
            sh "git rm -rf * > /dev/null"
            sh "cp -r  ../_site/* ."
            sh "git add --all ."
            sh "git status"
            sh "git commit -m 'Updating to #{ENV['TRAVIS_REPO_SLUG']}.github.io@#{sha}, tagged '#{ENV['TRAVIS_TAG']}'.'"

            # Make sure to make the output quiet, or else the API token will leak!
            sh "git push --force --quiet origin master"
            puts "Updated destination repo pushed to GitHub Pages"

            # tag to record when/where from built
            tag()
            puts "production tagged."
          end
        end
      else
        puts "Not in (tagged) 'master', hence no deployment to github.com/#{ENV['TRAVIS_REPO_SLUG']}.github.io"
      end
    end
  end


  desc 'Clean up generated site'
  task :clean do
    cleanup
  end
end
