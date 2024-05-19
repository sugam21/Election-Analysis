use election;
show tables;

select * from constituency_wise_results_2019;

--------------------------**2**----------------------------
--- Fixing PC_NAMES
--Certainly, here they are all enclosed in a single set of brackets: 
-- every pc_name(parliamentary constituency name) has space at the end. Removing the space at the end
update constituency_wise_results_2019 set pc_name = trim(pc_name)

update constituency_wise_results_2019
set state ="Delhi"
where state="NCT OF Delhi";

update constituency_wise_results_2019
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
        else pc_name
    end


-- make first letter of pc_name capital and everything else small
update constituency_wise_results_2019
set
    pc_name = concat(
        ucase(substring(pc_name, 1, 1)),
        lcase(substring(pc_name, 2))
    );


-- deleting the rest of party with entry less than 10 in the table.
with parties_to_delete as 
(select 
c.party,
count(*) as total_count
from constituency_wise_results_2019 c
left join party p
on c.party=p.party_name
where p.party_name is null and c.party<>"IND"
group by c.party)
delete from constituency_wise_results_2019
where party in (select party from parties_to_delete);


select 
*
from constituency_wise_results_2019 c
left join party p
on c.party=p.party_name
where p.party_name is null and c.party<>"IND"; 

update constituency_wise_results_2019
set party = "BMP"
where party="BMUP"


update constituency_wise_results_2019
set party = "NPP"
where party="NPEP"

update constituency_wise_results_2019
set party = "RJP"
where party="RJBP"

update constituency_wise_results_2019
set party = "PJP(S)"
where party="PUJP"

update constituency_wise_results_2019
set party = "AIADMK"
where party="ADMK"

update constituency_wise_results_2019
set party = "PSP(L)"
where party="PSPL"

update constituency_wise_results_2019
set party = "PPOI (D)"
where party="PPID"

update constituency_wise_results_2019
set party = "AAP"
where party="AAAP"

select distinct category
from constituency_wise_results_2019
