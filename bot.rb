require 'selenium-webdriver'
require 'json'

#Grab your creds and the tweet you want to post
config = JSON.parse(IO.read('./config.json'))
username = config['username']
password = config['password']
tweet = config['tweet']

#Set some browser options and the timeout for elements. 
#These allow for it to run in the background
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument("window-size=1920,1080")
options.add_argument("start-maximized")
options.add_argument("headless")
driver = Selenium::WebDriver.for(:chrome, options: options)
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

#Go to twitter, login, and post your tweet
driver.navigate.to "https://www.twitter.com/"

#Click login button
wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div/main/div/div/div/div[1]/div[2]/a[2]').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div/main/div/div/div/div[1]/div[2]/a[2]')
element.click

#Enter username in username field
wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[1]/label/div/div[2]/div/input').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[1]/label/div/div[2]/div/input')
element.click
element.send_keys username

#Enter password in password field
wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[2]/label/div/div[2]/div/input').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[2]/label/div/div[2]/div/input')
element.click
element.send_keys password

#Click 'login'
wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[3]/div').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[3]/div')
element.click

#Type your tweet
wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[2]/div').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[2]/div')
element.click
element.send_keys tweet

#Post the tweet
wait.until {driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[4]/div/div/div[2]/div[3]').displayed?}
element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[4]/div/div/div[2]/div[3]')
element.click

driver.quit
