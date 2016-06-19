class IncidentController < ApplicationController
  def index
  end

  def new
  end

  def show
  	format.pdf do
  		@example_text = "some text"
  		render :pdf => "file name",
  		       :template => "offers/show.pdf.erb",
  		       :layout => "pdf",
  		       :format => {
  		       	  :center => "Center",
  		       	  :left => "Left",
  		       	  :right => "Right"
  		       }
  end
end
