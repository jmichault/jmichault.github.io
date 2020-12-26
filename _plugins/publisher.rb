module Jekyll
  class PostPublisher < Generator
    safe false
   
    def generate(site)
      langs = ['eo','fr']
      langs.each do |lng|
        @files = Dir["#{lng}/_publish/*"]
        @files.each_with_index { |f,i| 
          now = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
          content = File.read(f)
          beghead = content.index(/^---.*/)
          content = content[beghead..-1]
          groupes = content.split(/(^---.*)/)
          if ! groupes[2].index(/^lang-ref: .*/) then
            titolo=""
            titolo_ind = groupes[2].index(/^title: /)
            titolo = groupes[2][titolo_ind+7..-1]
            titolo_ind = titolo.index("\n")-1
            titolo = titolo[0..titolo_ind]
            groupes[2] += "lang-ref: "+titolo+"\n"
          end
          if groupes[2].index(/^lang: .*/) then
            groupes[2].gsub!(/^lang: .*/ , 'lang: '+lng )
          else
            groupes[2] += "lang: "+lng+"\n"
          end
          if groupes[2].index(/^lang-niv: .*/) then
            groupes[2].gsub!(/^lang-niv: .*/ , 'lang-niv: fonto')
          else
            groupes[2] += "lang-niv: fonto\n"
          end
          content = groupes.join
          File.open(f, 'wb') { |file| file.write(content) }
          now = Date.today.strftime("%Y-%m-%d")
          File.rename(f, "#{lng}/_posts/#{now}-#{File.basename(f)}") 
        }
      end
    end
  end
end
