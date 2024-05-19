-- create table for candidate with candidate_id (candidate_name,sex,age,category)
-- create table for location with location_id (state,pc_name)
-- create table for party (party_name,description,party_symbol)
-- votes (location_id,candidate_id,party_id,general_votes,postal_votes,total_votes,total_electors)
-- watch correlation withList of Indian states and union territories by access to safe drinking water 
-- Indian states ranking by availability of toilets
-- List of Indian states by child nutrition
-- List of states and union territories of India by crime rate
-- Indian states ranking by ease of doing business
-- https://en.wikipedia.org/wiki/List_of_states_and_union_territories_of_India_by_households_having_electricity
-- List of states and union territories of India by households having electricity
-- Indian states ranking by incidents of human trafficking
-- List of states and union territories of India by unemployment rate


select DISTINCT state
from constituency_wise_results_2014
order by state asc;