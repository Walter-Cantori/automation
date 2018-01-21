=begin
After do |scenario|
    if scenario.failed?
        page.save_screenshot(scenario.name+".png")
        embed(scenario.name+".png", 'image/png')
    end
end
=end


=begin
Before do |scenario|
    @scenario_name = scenario.name
end

AfterStep do |result, step,|
    path = "results/"+@scenario_name+'/'+step.name+".png"
    page.save_screenshot(path)
    embed(path, 'image/png')
end
=end