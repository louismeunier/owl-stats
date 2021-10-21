require 'watir'
require 'webdrivers/chromedriver'

URL='https://overwatchleague.com/en-us/statslab'

args=["--no-sandbox","-disable-dev-shm-usage"]
browser=Watir::Browser.new :chrome, headless: true, options: {args: args}

browser.goto URL

ul=browser.ul(:class => "sl-downloads")

years=[2018,2019,2020,2021]

for n in (0..3) do
    puts `curl #{ul.lis[n].a.href} --output #{years[n]}.zip`
end

browser.close