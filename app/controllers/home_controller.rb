class HomeController < ApplicationController

  add_breadcrumb "Dashboard", :root_path

  def index
  	@incidents_chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
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
      f.options[:title][:text] = "Overview of Incidents"
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

    @area_incidents_chart = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name => 'Gym', :data=> [Incident.where(:area_id => 1).count])
      f.series(:name => 'Cafeteria', :data=> [Incident.where(:area_id => 2).count])
      f.series(:name => 'Teen Room', :data=> [Incident.where(:area_id => 3).count])
      f.series(:name => 'Education Room', :data=> [Incident.where(:area_id => 4).count])
      f.series(:name => 'Restroom', :data=> [Incident.where(:area_id => 5).count])
      f.series(:name => 'Office', :data=> [Incident.where(:area_id => 6).count])
      f.title({ :text => "Incidents in Areas"})
      f.xAxis(categories: ["Areas"])

      f.options[:chart][:defaultSeriesType] = "column"
	  end

    @program_incidents_chart = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name => 'Branches', :data=> [Incident.where(:program_id => 1).count])
      f.series(:name => "Comin' Up", :data=> [Incident.where(:program_id => 2).count])
      f.series(:name => 'ETS', :data=> [Incident.where(:program_id => 3).count])
      f.series(:name => 'UB', :data=> [Incident.where(:program_id => 4).count])
      f.series(:name => 'Prevention', :data=> [Incident.where(:program_id => 5).count])
      f.title({ :text => "Incidents by Program"})
      f.xAxis(categories: ["Programs"])

      f.options[:chart][:defaultSeriesType] = "column"  
    end
  end
end
