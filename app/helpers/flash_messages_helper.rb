module FlashMessagesHelper
  def flash_messages
    if flash[:error].present?
      html = <<-HTML
        <div class='alert alert-error'>
          <button type='button' class='close' data-dismiss='alert'>&times;</button>
          #{flash[:error]}
        </div>
      HTML
      html.html_safe
    elsif flash[:notice].present?
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