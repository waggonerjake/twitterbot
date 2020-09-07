require 'selenium-webdriver'
require 'json'

config = JSON.parse(IO.read('./config.json'))
username = config['username']
password = config['password']
tweet = config['tweet']

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument("window-size=1920,1080")
options.add_argument("start-maximized")
options.add_argument("headless")
driver = Selenium::WebDriver.for(:chrome, options: options)
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

driver.navigate.to "https://www.twitter.com/"

wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div/main/div/div/div/div[1]/div[2]/a[2]').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div/main/div/div/div/div[1]/div[2]/a[2]')
element.click

wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[1]/label/div/div[2]/div/input').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[1]/label/div/div[2]/div/input')
element.click
element.send_keys username

wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[2]/label/div/div[2]/div/input').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[2]/label/div/div[2]/div/input')
element.click
element.send_keys password

wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[3]/div').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[3]/div')
element.click

wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[2]/div').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[2]/div')
element.click
element.send_keys tweet

wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[4]/div/div/div[2]/div[3]').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[4]/div/div/div[2]/div[3]')
element.click


driver.quit
