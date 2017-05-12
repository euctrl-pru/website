require 'rake'
require 'html-proofer'
require 'date'
require 'yaml'

CONFIG = YAML.load(File.read('_config.yml'))



# remove generated site
def cleanup
  sh 'rm -Rf _site'
end

# launch jekyll
def jekyll(directives = '')
  sh 'bundle exec jekyll ' + directives
end

#############################################################################
# Development tasks
#############################################################################

# Usage: rake dev, rake dev:serve
task :dev => ["dev:serve"]
namespace :dev do

  desc 'Serve development Jekyll site locally'
  task :serve do
    puts 'Starting up development Jekyll site server...'
    jekyll('serve --future --config _config.yml,_config_dev.yml')
  end

  desc 'Build development Jekyll site'
  task :build => :clean do
    puts 'Building development Jekyll site...'
    jekyll('build --future --config _config.yml,_config_dev.yml')
  end

  desc 'Check links: site needs to be running.'
  task :test do
    HTMLProofer.check_directories(["_site/"], {
      :check_favicon => false,
      :empty_alt_ignore => false,
      :href_ignore => ["#", "http://localhost:4000", /^(https?\:\/\/)?(www\.)?youtube\.com\/.+$/],
      :parallel => {:in_processes => 4},
      :only_4xx => true,
      :check_html => false,
      :typhoeus => {
        :timeout => 3 }
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
task :prod => ['prod:build']
namespace :prod do

  desc 'Build production Jekyll site'
  task :build => :clean do
    puts 'Building production Jekyll site...'
    jekyll('build --future')
  end

  desc 'Generate the site and push changes to remote origin'
  task :deploy do

    # Configure git if this is run in Travis CI, see https://github.com/openingscience/book/blob/master/Rakefile
    if ENV['TRAVIS']
      puts 'Under TraviCI control...'
      # Detect pull request
      if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
        puts 'Pull request detected. Not proceeding with deploy.'
        exit 0
      end

      puts 'setting user configs ...'
      sh "git config --global user.name '#{ENV['GIT_NAME']}'"
      sh "git config --global user.email '#{ENV['GIT_EMAIL']}'"
      sh "git config --global push.default simple"

      # deploy only if on master branch eventually
      if ENV['TRAVIS_BRANCH'].to_s.scan(/^master$/).length > 0
        puts 'Handling "master" branch'

        # get the tag for HEAD
        committag = `git describe --exact-match $(git rev-parse HEAD)`.delete("\n")
        puts "here is the tag I found: -->#{committag}<--"
        if committag.length == 0
          puts "No tag! Hence not deploying to github.com/#{CONFIG['dest_user']}/#{CONFIG['dest_repo']}.github.io"
          exit 0
        else
          puts "Building and deploying with tag '#{committag}'"
          # Generate the site...it goes in _site
          puts 'Generating site...'
          jekyll('build --future')

          # cloning destination repo
          puts "Cloning repo #{CONFIG['dest_user']}/#{CONFIG['source_repo']} ..."
          sh "git clone https://#{ENV['GIT_NAME']}:#{ENV['GH_TOKEN']}@github.com/#{CONFIG['dest_user']}/#{CONFIG['dest_repo']}.git > /dev/null"

          # Commit and push to github
          # - match the commit SHA
          sha = `git rev-parse HEAD`.delete("\n")
          puts 'Now moving to #{CONFIG["dest_repo"]...'
          Dir.chdir("#{CONFIG['dest_repo']}") do

            puts 'Removing all...'
            sh "git rm -rf * > /dev/null"

            puts 'Copying all newly generated pages from "../_site/"...'
            sh "cp -r  ../_site/* ."

            puts 'Adding all files for a new commit...'
            sh "git add --all ."
            sh "git status"

            puts 'Committing all...'
            sh "git commit -m 'Updating to github.com/#{ENV['TRAVIS_REPO_SLUG']}/@#{sha} tagged #{committag}.'"

            # Make sure to make the output quiet, or else the API token will leak!
            puts '(Indirectly) Pushing to the Internet...'
            sh "git push --force --quiet origin master"
            puts "Destination repo, #{CONFIG['dest_user']}/#{CONFIG['dest_repo']}, pushed to GitHub Pages."

          end
        end
      else
        puts "Not in 'master' branch, hence no deployment to #{CONFIG['dest_user']}/#{CONFIG['dest_repo']}"
      end
    end
  end


  desc 'Clean up generated site'
  task :clean do
    cleanup
  end
end

######################
# Notification tasks #
######################

# Notify the search engines to crawl again the newly published site
# Usage: rake notify
task :notify => ["notify:pingomatic", "notify:google", "notify:bing"]
desc "Notify various services that the site has been updated"
namespace :notify do

  desc "Notify Ping-O-Matic"
  task :pingomatic do
    begin
      require 'xmlrpc/client'
      puts "* Notifying Ping-O-Matic that the site has updated"
      XMLRPC::Client.new('rpc.pingomatic.com', '/').call('weblogUpdates.extendedPing',
                                                         'ansperformance.eu' ,
                                                         'http://ansperformance.eu',
                                                         'http://ansperformance.eu/atom.xml')
    rescue LoadError
      puts "! Could not ping ping-o-matic, because XMLRPC::Client could not be found."
    end
  end

  desc "Notify Google of updated sitemap"
  task :google do
    begin
      require 'net/http'
      require 'uri'
      puts "* Notifying Google that the site has updated"
      Net::HTTP.get('www.google.com', '/webmasters/tools/ping?sitemap=' + URI.escape('http://ansperformance.eu/sitemap.xml'))
    rescue LoadError
      puts "! Could not ping Google about our sitemap, because Net::HTTP or URI could not be found."
    end
  end

  desc "Notify Bing of updated sitemap"
  task :bing do
    begin
      require 'net/http'
      require 'uri'
      puts '* Notifying Bing that the site has updated'
      Net::HTTP.get('www.bing.com', '/webmaster/ping.aspx?siteMap=' + URI.escape('http://ansperformance.eu/sitemap.xml'))
    rescue LoadError
      puts "! Could not ping Bing about our sitemap, because Net::HTTP or URI could not be found."
    end
  end
end
