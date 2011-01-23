=begin
 Functions for things taken from config/ric_*yml

 RicApp     = YAML.load_file("#{dir}/ric_app.yml")        # Application: Name, Descr, Roadmap, ...
 RicLayout  = YAML.load_file("#{dir}/ric_layout.yml")     # DRY Layout (TODO)
 RicHistory = YAML.load_file("#{dir}/ric_history.yml")    # History of commits/logs
=end

module RicYamlHelper
    # Things I cant live without...
    #
    
    #def show_roadmap
    #  'TODO ROADMAP'
    #end
    
    def ric_app_name
      RicApp['head']['name']
    end
    
    # can be set explicitly in [head >> version] or deducted as the last in VersionHistory
    def ric_app_version()
      RicApp['head']['version'] || 
        RicApp['VersionHistory'].sort{|x,y| y <=> x }.first.first
    end
    
    def render_ricapp_synoptic
      ret = '' 
      RicApp['head'].sort{|a,b| a<=>b}.each do |key,val|
        ret += content_tag(:li, 
          content_tag(:b,key) + ' ' + val
        )
      end
      return ret.html_safe
    end
    
    # TODO sort on versions: http://snippets.dzone.com/posts/show/7653
    def render_ricapp_history()
      ret = '' #ret = content_tag(:h1, 'App history' )
      RicApp['VersionHistory'].sort{|x,y| y <=> x }.each do |ver,date_comment|
        ret << content_tag(:li, render_keyval(ver,date_comment) )
      end
      ret.html_safe
    end
    
    def render_keyval(k,val)
      content_tag(:b,k) + ': ' + val
    end
    
    def render_history_headline()
      last_entry = RicApp['VersionHistory'].sort{|x,y| y <=> x }.first
      return last_entry[1]
    end
    
    def anything_to_html(son,opts={})
      ret = ''
      if opts != {}
      ret << "(Options: " + anything_to_html(opts) + ")"
      end
      if son.class == Array
        ret << "<ul class='subtopic' >"
        son.each{|subtopic|
          ret << content_tag(:li, anything_to_html(subtopic).html_safe ) # '- ' + 
        }
        ret << "</ul>"
      elsif son.class == Hash
        #ret << hash_to_html(son)
        ret += '<ul class="maintopic" >'
        son.each{ |k,val|
          ret << content_tag(:li, ( anything_to_html(k) + ' => ' + anything_to_html(val) ).html_safe )
         }
        ret << "</ul>"
      elsif son.class == String
        ret << "<font color='navy' class='ricclass_string' >#{son}</font>"
      elsif son.class == Symbol
        ret << "<i><font color='gray' class='ricclass_symbol' >:#{son}</font></i>"
      else
        ret << "(Unknown Class: #{son.class}) <b>#{son}</b>"
      end
      ret.html_safe
    end
    
    def render_ricapp_menus
      ret = anything_to_html(RicLayout['sub_menus'], :title => :RicAppMenus)
    end
    
    def render_ricapp_todo
      ret = ''
      #ret += '<ul class="maintopic" >'
      RicApp['TODO'].each{|topic,a_subtopics|
        ret << content_tag(:li, content_tag(:b,topic) )
        ret << "<ul class='subtopic' >"
        a_subtopics.each{|subtopic|
          ret << content_tag(:li,subtopic) 
        }
        ret << "</ul>"
       }
      #ret << "</ul>"
      ret
    end
    
    def render_ric_app(opts={})
      ret = '' # content_tag(:h1, "Auto RicApp")
      # :all
      available_topics = [
       [ :synoptic, :render_ricapp_synoptic],
       [ :history , :render_ricapp_history],
       [ :todo    , :render_ricapp_todo],
       [ :menus   , :render_ricapp_menus],
      ]
      # ...
      topics = available_topics # based on opts, u may choose to decide differently..
      topics.each do |topic,func| 
        ret << content_tag(:li, link_to("Anchor to #{topic}", "#ricapp_#{topic}") )
      end
      #ret += content_tag(:i, "Opts: #{opts}") 
      topics.each{ |title,func_name| 
        ret += content_tag(:h2, title.to_s.capitalize, :id => "ricapp_#{title}" )
        ret += self.send(func_name).html_safe
      }
      ret.html_safe
    end

end #/RicYamlHelper
