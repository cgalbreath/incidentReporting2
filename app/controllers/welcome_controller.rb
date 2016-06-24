class WelcomeController < ApplicationController
  def index
  	@chart1 = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      series = {
               :type=> 'pie',
               :name=> 'Browser share',
               :data=> [
                  ['Employee Incidents',   45.0],
                  ['Suspensions',       26.8],
                  {
                     :name=> 'Child Services',    
                     :y=> 12.8,
                     :sliced=> true,
                     :selected=> true
                  },
                  ['Altercations',    8.5],
                  ['Emergency',     6.2],
                  ['Police',   0.7]
               ]
      }
      f.series(series)
      f.options[:title][:text] = "INCIDENTS"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
	end
  end
end
