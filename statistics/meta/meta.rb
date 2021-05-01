#!/usr/bin/ruby

def format(year, fileName)
    puts `sed -i'' 's/\\+/|/g' temp.md`
    puts `sed -i'' '1d' temp.md`
    puts `sed -i'' '$d' temp.md`
    puts `sed -i'' '1s/^/\\n'#{year}'\\n\\n /' temp.md`
    puts `cat temp.md >> /home/travis/build/louismeunier/owl-stats/out/#{fileName}.md`
    puts `rm temp.md`
end

def query(sql, file, desc)
    puts `echo "## [#{file}](/#{file.gsub(/\s+/, "")})\\n" >> /home/travis/build/louismeunier/owl-stats/out/README.md`
    puts `echo "### #{desc} \\n\\n" >> /home/travis/build/louismeunier/owl-stats/out/README.md`
    puts `echo "# #{file}\\n" >> /home/travis/build/louismeunier/owl-stats/out/#{file.gsub(/\s+/, "")}.md`
    puts `echo "## #{desc}\\n" >> /home/travis/build/louismeunier/owl-stats/out/#{file.gsub(/\s+/, "")}.md`
    for year in (2018..2021) do
    	puts `mysql -u root --password='' -t -e "#{sql % year}" >> temp.md`;
        format(year, file.gsub(/\s+/, ""));
    end
end
