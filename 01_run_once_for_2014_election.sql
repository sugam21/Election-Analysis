
select distinct pc_name
from constituency_wise_results_2014
order by pc_name asc;



update constituency_wise_results_2014
set state ="Delhi"
where state="NCT OF Delhi";

--------------------------**1**----------------------------
--- Fixing States
-- Since Andra Pradesh has been bifercated into telengana so fixing all the constituencies which belong to telengana.
update constituency_wise_results_2014
set
    state = "Telangana"
where
    pc_name in (
        "Adilabad",
        "Bhongir",
        "Chevella",
        "Hyderabad",
        "Karimnagar",
        "Khammam",
        "Mahabubabad",
        "Mahbubnagar",
        "Malkajgiri",
        "Medak",
        "Nagarkurnool",
        "Nalgonda",
        "Nizamabad",
        "Peddapalli",
        "Secunderabad",
        "Warangal",
        "Zaheerabad"
    )


--------------------------**2**----------------------------
--- Fixing PC_NAMES
--Certainly, here they are all enclosed in a single set of brackets: 
-- every pc_name(parliamentary constituency name) has space at the end. Removing the space at the end
update constituency_wise_results_2014 set pc_name = trim(pc_name)
-- changing the name of pc_name where was spelling mistake

update constituency_wise_results_2014
set
    pc_name = case
        when pc_name = "Peddapalle" then "Peddapalli"
        when pc_name = "Zahirabad" then "Zaheerabad"
        when pc_name = "Secundrabad" then "Secunderabad"
        when pc_name = "CHELVELLA" then "Chevella"
        when pc_name = "Aruku" then "Araku valley"
        when pc_name = "Narsapuram" then "Narasapuram"
        when pc_name = "ARUNACHAL WEST" then "Arunachal West"
        when pc_name = "Gauhati" then "Guwahati"
        when pc_name = "Jahanabad" then "Jehanabad"
        when pc_name = "Ahmadnagar" then "Ahmednagar"
        when pc_name = "Budaun" then "Budaun"
        else pc_name
    end



-- make first letter of pc_name capital and everything else small
update constituency_wise_results_2014
set
    pc_name = concat(
        ucase(substring(pc_name, 1, 1)),
        lcase(substring(pc_name, 2))
    );

--------------------**3**-------------
-- Fixing Sex
-- Deleting values with no sex data.
delete from constituency_wise_results_2014
where sex="";

--------------------**4**-------------
-- Fixing Party
-- party with "AAAP" is actually AAP known as Aam Aadmi Party
update constituency_wise_results_2014
set party = "AAP"
where party="AAAP"

update constituency_wise_results_2014
set party = "MSP",party_symbol="Flag with rising sun"
where party="MaSP"

update constituency_wise_results_2014
set party = "IND",party_symbol=""
where party="A S P"

update constituency_wise_results_2014
set party = "BMP"
where party="BMUP"


update constituency_wise_results_2014
set party = "SOP"
where party="SP(I)"

update constituency_wise_results_2014
set party="AIADMK"
where party="ADMK"

-- Analysis
-- there is brief case in party sumbol for peace party so chaning to ceiling fan
select 
party_symbol,
count(*)
from constituency_wise_results_2014
where party="PECP"
group by party_symbol
order by count(*);

-- Solution
update constituency_wise_results_2014 
set party_symbol = "Ceiling Fan"
where party="PECP";

-- deleting the rest of party with entry less than 10 in the table.
with parties_to_drop as 
(select 
c.party,
count(*) as total_count
from constituency_wise_results_2014 c
left join party p
on c.party=p.party_name
where p.party_name is null and c.party<>"IND"
group by c.party)
delete from constituency_wise_results_2014
where party in (select party from parties_to_drop)