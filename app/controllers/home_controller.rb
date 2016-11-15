class HomeController < ApplicationController

  add_breadcrumb "Dashboard", :root_path

  def index
  	@incidents_chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170], :reflow=> false} )
      series = {
               :type=> 'pie',
               :name=> 'Browser share',
               :data=> [
                  ['Injuries',   Injury.where.not(:injury_description => '').count],
                  ['Behaviourals',   Behavioural.where.not(:behav_description => '').count],
                  ['Misconducts',   Misconduct.where.not(:misconduct_description => '').count],
                  ['Property Damages',   PropertyDamage.where.not(:prop_description => '').count],
                  ['Thefts',   Theft.where.not(:theft_description => '').count],
                  ['Vehicle Accident',   VehicleAccident.where.not(:veh_description => '').count]
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

    @users_chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170], :reflow=> false} )
      series = {
               :type=> 'pie',
               :name=> 'Browser share',
               :data=> [
                  ['Injuries',   Injury.where.not(:injury_description => '').count],
                  ['Behaviourals',   Behavioural.where.not(:behav_description => '').count],
                  ['Misconducts',   Misconduct.where.not(:misconduct_description => '').count],
                  ['Property Damages',   PropertyDamage.where.not(:prop_description => '').count],
                  ['Thefts',   Theft.where.not(:theft_description => '').count],
                  ['Vehicle Accident',   VehicleAccident.where.not(:veh_description => '').count]
               ]
      }
      f.series(series)
      f.options[:title][:text] = "User Logins"
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
