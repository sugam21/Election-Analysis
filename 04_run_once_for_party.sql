use election;

-- Adding new column for primary key
alter table party add column party_id int;
set @my_increment:=0;
update party
set party_id=@my_increment := @my_increment+1
order by party_name

-- make newly created table a primary key
alter table party
add primary key (party_id);

-- making it auto increment
ALTER TABLE party MODIFY COLUMN party_id INT auto_increment;

alter table party drop column party_code;
-- adding party information in party table
insert into party(party_name,description)
value("BCUF","Backward Castes United Front")

insert into party(party_name,description)
value("MSP","Mahajana Socialist Party")

insert into party(party_name,description)
value("CPI(ML)(L)","Communist Party of India (Marxist–Leninist) Liberation")

insert into party(party_name,description)
value("JaSPa","Jai Samaikyandhra Party")

insert into party(party_name,description)
value("JMBP","Jai Maha Bharath Party")

insert into party(party_name,description)
value("IND","Independent")

insert into party(party_name,description)
value("WPOI","Welfare Party Of India")

insert into party(party_name,description)
value("AIUDF","All India United Democratic Front")

insert into party(party_name,description)
value("JDP","Jharkhand Disom Party")

insert into party(party_name,description)
value("JPS","Janvadi Party(Socialist)")

insert into party(party_name,description)
value("NADP","Naya Daur Party")

insert into party(party_name,description)
value("KAP","Karunaadu Party")

insert into party(party_name,description)
value("NPP","National People's Party")

insert into party(party_name,description)
value("SUCI(C)","Socialist Unity Centre of India (Communist)")


-- updated party_name PP to PECP;
update party
set party_name="PECP"
where party_name="PP" and description="Peace Party";

update party
set party_name="AIFB",description="All India Forward Bloc"
where party_name="FBL" and description="Forward Bloc";

update party
set party_name="RJP"
where party_name="RJSPS" and description="Rashtriya Jansambhavna Party";

select * from party;