# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    movie = Movie.create!
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
   e1 = Movie.name
   e2 = Movie.name
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
end

Given(/^I check the 'PG' and 'R' checkboxes$/) do
  check_box_pg = find('#ratings_form input:nth-child(1)').set(true)
  check_box_r = find('#ratings_form input:nth-child(4)').set(true)
end

Then(/^press "(.*?)" the search form on the homepage$/) do |button|
  button = find('#ratings_submit')
end

Then(/^ensure that PG and R movies are visible$/) do
  movies = Movie.all_ratings
  movies.include?('PG')
  movies.include?('R')
end

Then(/^ensure that other movies are not visible$/) do
  movies = Movie.all_ratings
  movies.exclude?('G')
  movies.exclude?('PG-13')
  movies.exclude?('NC-17')
end

Given(/^I check the following ratings: G, PG, R$/) do
  check_box_g = find('#ratings_form input:nth-child(0)').set(true)
  check_box_pg = find('#ratings_form input:nth-child(1)').set(true)
  check_box_r = find('#ratings_form input:nth-child(4)').set(true)
end

Given(/^I check all the rating checkboxes$/) do
  check_box_pg = find('#ratings_form input:nth-child(1)').set(true)
  check_box_pg_13 = find('#ratings_form input:nth-child(2)').set(true)
  check_box_nc = find('#ratings_form input:nth-child(3)').set(true)
end

Then(/^I should see all of the movies$/) do
   movies = Movie.all_ratings
   movies.include?('G')
   movies.include?('PG')
   movies.include?('PG-13')
   movies.include?('NC-17')
   movies.include?('R')
end

Then(/^ensure all of the movies are there$/) do
  movies = Movie.all_ratings
  movies.include?('G')
  movies.include?('PG')
  movies.include?('PG-13')
  movies.include?('NC-17')
  movies.include?('R')
end

Given(/^I click on "(.*?)"$/) do |click_title|
  click_title = find('#title_header').click
end

When(/^I see the list of movies$/) do
  movies = Movie.all_ratings
  movies.include?('G')
  movies.include?('PG')
  movies.include?('PG-13')
  movies.include?('NC-17')
  movies.include?('R')
end


