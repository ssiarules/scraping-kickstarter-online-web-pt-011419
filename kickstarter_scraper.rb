require 'nokogiri' # require libraries/modules here
require 'pry'

#WE WANT TO CREATE A HASH FOR EACH PROJECT 
# :projects => {
#   "My Great Project"  => {
#     :image_link => "Image Link",
#     :description => "Description",
#     :location => "Location",
#     :percent_funded => "Percent Funded"
#   },
#   "Another Great Project" => {
#     :image_link => "Image Link",
#     :description => "Description",
#     :location => "Location",
#     :percent_funded => "Percent Funded"
#   }
# }

# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("ul.project-meta span.location-name").text
# percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i

 
def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
 
  projects = {}
 
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
 
  # return the projects hash
  projects
end











#THIS WAS A DIFFERENT WAY WE DID IN STUDY GROUP LAB - 
# def create_project_hash
#   projects = {}
#   html = File.read('fixtures/kickstarter.html') 
#   kickstarter = Nokogiri::HTML(html)
#   kickstarter.css("li.project.grid_4").each do |project|
#     title = project.css("h2.bbcard_name strong a").text 
#     image_link = project.css("div.project-thumbnail a img") .attribute("src").value
#     description = project.css("p.bbcard_blurb").text 
#     location = project.css("ul.project-meta span.location-name").text
#     percent_funded = ("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
   
    
#     projects[title.to_sym] = {
#         :image_link => image,
#         :description => description,
#         :location => location, 
#         :percent_funded => percent_funded
#       }
#       end 
#       projects
#   end 
   
 

 

   

