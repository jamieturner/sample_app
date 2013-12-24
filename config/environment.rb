# Load the Rails application.
require File.expand_path('../application', __FILE__)

ENV['GEM_HOME'] = '/path/to/gems'

ENV['PUBLISHABLE_KEY'] = 'pk_test_ZDGtg430OrlEmaHnhJFEfCE9'
ENV['SECRET_KEY'] = 'sk_test_IkzixacJX3zSanfKPSFfetvq'


# Initialize the Rails application.
SampleApp::Application.initialize!


RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')
