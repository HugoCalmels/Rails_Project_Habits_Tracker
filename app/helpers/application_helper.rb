module ApplicationHelper
  def youtube_video(url)
    render :partial => 'elements/youtube', :locals => { :url => url }
  end 
end
