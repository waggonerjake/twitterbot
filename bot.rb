require 'selenium-webdriver'
require 'json'

config = JSON.parse(IO.read('./config.json'))
username = config['username']
password = config['password']
tweet = config['tweet']

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://www.twitter.com/"

sleep(5)

element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div/main/div/div/div/div[1]/div[1]/div/form/div/div[1]/div/label/div/div[2]/div/input')
element.click
element.send_keys username

element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div/main/div/div/div/div[1]/div[1]/div/form/div/div[2]/div/label/div/div[2]/div/input')
element.click
element.send_keys password

element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div/main/div/div/div/div[1]/div[1]/div/form/div/div[3]/div')
element.click

sleep(5)

element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[2]/div')
element.click
element.send_keys tweet

element = driver.find_element(xpath: '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[4]/div/div/div[2]/div[3]')
element.click

sleep (5)
driver.quit