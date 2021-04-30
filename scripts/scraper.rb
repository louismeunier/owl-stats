require 'watir'

URL='https://overwatchleague.com/en-us/statslab'

browser=Watir::Browser.new

browser.goto URL

ul=browser.ul(:class => "sl-downloads")

years=[2018,2019,2020,2021]

for n in (0..3) do
    puts `curl #{ul.lis[n].a.href} --output #{years[n]}.zip`
end

browser.close