require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'capybara'
require 'site_prism'
require 'capybara/cucumber'
require 'pry'

ENVIRONMENT = ENV['ENVIRONMENT']
ENVIRONMENT_CONFIG = YAML.load_file(File.dirname(__FILE__) + "/environment/#{ENVIRONMENT}.yml")
puts ENVIRONMENT_CONFIG
URL = ENVIRONMENT_CONFIG['url']

Capybara.register_driver :my_chrome do |app|  
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--incognito')
    options.add_argument('--start-maximized')
    options.add_argument('--window-size-1420-835')
    options.add_argument('--ignore-ssl-errors')
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-gpu')
    options.add_argument('--disable-translate')
    options.add_argument('--no-sandbox')
    options.add_argument('--acceptInsecureCerts=true')
    options.add_argument('--disable-impl-side-painting')
    options.add_argument('--debug_level=3')

    if ENV['HEADLESS']
        options.add_argument('--headless')
        options.add_argument('--disable-site-isolation-trials')
    end

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :my_firefox do |app|
    options = Selenium::WebDriver::Firefox::Options.new

    options.add_argument('--private')
    options.add_argument('--ignore-ssl-errors=true')
    options.add_argument('--accept-insecure-certs=true')

    if ENV['HEADLESS']
        options.add_argument('--headless')
        options.add_argument('--disable-site-isolation-trials')
    end

    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options).tap do |driver|
        driver.browser.manage.window.maximize
    end
end

if ENV['BROWSER'] == 'chrome'
    Capybara.default_driver = :my_chrome
elsif ENV['BROWSER'] == 'firefox'
    Capybara.default_driver = :my_firefox
else
    raise "Navegador não suportado: #{ENV['BROWSER']}"
end

Capybara.app_host = URL
Capybara.default_max_wait_time = 10

World(Capybara)
