use election;

show tables;

select 
*
from constituency_wise_results_2014;

SELECT *
FROM dim_states_codes;

select *
from constituency_wise_results_2019
where state = "Telangana" and pc_name="Adilabad "

select
p.party_id,
c.state,
c.pc_name,
c.candidate,
c.sex,
c.age,
c.category,
c.general_votes, 
c.postal_votes,
c.total_votes
from constituency_wise_results_2019 c 
left join party p 
on c.party = p.party_name
order by p.party_id;


select
p.party_id,
c.state,
c.pc_name,
c.candidate,
c.sex,
c.age,
c.category,
c.general_votes, 
c.postal_votes,
c.total_votes
from constituency_wise_results_2014 c 
left join party p 
on c.party = p.party_name
order by p.party_id,state,pc_name;

select * from party where party_id = 1;

select * from dim_states_codes;

select state_name
from dim_states_codes
where state_name not in (select 
DISTINCT c.state
from constituency_wise_results_2019 c
left join dim_states_codes s
on s.state_name = c.state)


select state,pc_name
from constituency_wise_results_2014
group by state,pc_name
union 
select state,pc_name
from constituency_wise_results_2019
group by state,pc_name