module RictablesHelper
  # generate a static number: 1,2,3 per page

    # CSS made from http://www.duoh.com/csstutorials/csstables/
  def tableric(title,aoa,opts={})
    border = opts.fetch(:border, Rails.env == 'production' ? 0 : 1 ) # 10 todo => development=1/0
    unique_title = "TableRic_#{title.to_s.gsub(/^a-z0-9_/,'')}"
    id = opts.fetch(:id, unique_title ) # 10 todo => development=1/0
    cls    = opts.fetch :table_class, 'rictable_table'
    table_html = <<-HTML 
<table border='#{border}' class='#{cls}' >
    <caption>Table #1: #{title}</caption>
    <tr class='rictable_th' >
      <th scope="col" abbr="IDs" class="nobg" >IDs</th>
      <th scope="col" abbr="Dual 1.8GHz">Key</th>
      <th scope="col" abbr="Dual 2GHz">Val</th>
    </tr>
    HTML
    count = 0
    aoa.each{|arr| 
      count += 1
      opts[:tr_number] = count
      table_html += trtd(arr,opts) #}.join('')  
    }  
    table_html += "</table>"
    table_html.html_safe
  end
  alias :rictable :tableric
  
  def trtd(arr,opts={})
    cls = opts.fetch :tr_class, 'rictable_tr'
    odd_class = opts[:tr_number].odd? ? 'ric_odd' : 'ric_even'
    tr_html = <<-TR_HTML
    <tr class='#{cls}' class="#{odd_class}" >
        <td class="#{cls} #{odd_class}" scope="row" >##{opts[:tr_number]}</td>
#{ arr.map{|el| td(el,opts) }.join("\n") } 
    </tr>
    TR_HTML
    return tr_html
  end
  
  def td(el,opts={})
    cls = opts.fetch :td_class, 'rictable_td'
    "\t\t<td class='#{cls}' >#{el}</td>"
  end
 
end