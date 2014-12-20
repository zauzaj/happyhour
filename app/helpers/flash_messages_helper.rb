module FlashMessagesHelper
  def flash_messages
    if flash[:alert]
      html = <<-HTML
        <div class='alert alert-error'>
          <button type='button' class='close' data-dismiss='alert'>&times;</button>
          #{flash[:alert]}
        </div>
      HTML
      html.html_safe
    elsif flash[:notice]
      html = <<-HTML
        <div class='alert alert-success'>
          <button type='button' class='close' data-dismiss='alert'>&times;</button>
          #{flash[:notice]}
        </div>
      HTML
      html.html_safe
    end
  end
end