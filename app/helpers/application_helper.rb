module ApplicationHelper
  def youtube_video(url)
    render :partial => 'elements/youtube', :locals => { :url => url }
  end 

  


  def containsFirstDayOfTheMonth(week) 

  if week[0] == week[0].beginning_of_month 
    return true
  elsif week[1] == week[1].beginning_of_month
    return true
  elsif week[2] == week[2].beginning_of_month
    return true
  elsif week[3] == week[3].beginning_of_month
    return true
  elsif week[4] == week[4].beginning_of_month
    return true
  elsif week[5] == week[5].beginning_of_month
    return true
  elsif week[6] == week[6].beginning_of_month
    return true
  else 
    return false
  end

  end

 

  def findMonth(week)
    return week[6].strftime("%B")

  end

  def test(array)
    
    
    array.select.with_index do |el, i|
      i != array.index(el)
     end
     puts array

    result = []

    array.each do |el|
      if 
      puts el.date
      puts el.id
      puts "success" + el.cycle_result_success.to_s
      puts "failed" + el.cycle_result_failed.to_s
    end
  end
  end




end
