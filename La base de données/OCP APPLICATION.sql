create database OCPAPP

use OCPAPP;



create table Login_user (
Login_ID varchar (25) primary key ,
Login_Password varchar (25) ,
Login_rang varchar (1)
)
insert into Login_user values ('Nadi_Raj','DBFXLS','M')
insert into Login_user values ('Admin','Admin','A')


select * from Compte_Banque
SELECT * from Login_user

delete Login_user where LTRIM(Login_ID)='Admins'
delete type_Operation where nom_type='Pèlerinage'


CREATE TABLE Compte_Banque (
  Num_Compte varchar(24) primary key ,
  Code_ville	int references Ville  ,
  Agence varchar(25)

)


insert into Compte_Banque values ('011590000009210006006980',46000,'BMCE BANK')

insert into Compte_Banque values ('007590000935400000001631',46000,'ATTIJARIWAFA BANK')




drop table Ville 
create table Ville (
Code_ville int primary key ,
Nom_ville varchar(20),
)
insert into Ville values (10000,'Rabat')
insert into Ville values (11000,'Sale')
insert into Ville values (12000,'Temara')
insert into Ville values (20000,'Casabalanca')
insert into Ville values (46000,'Safi')
select * from Ville

select * from Compte_Banque where Agence='BMCE BANK'
select * from type_Operation where nom_type ='Pèlerinage'
insert into type_Operation values ('Pension Alimentaire')
insert into type_Operation values ('Ordre de Virement')
insert into type_Operation values ('Pèlerinage')
insert into type_Operation values ('Prix d encouragement')
insert into type_Operation values ('Boursse scolaire')
insert into type_Operation values ('Autre')
SELECT * from type_Operation
delete type_Operation where nom_type='Mise à disposition'
drop table type_Operation
create table type_Operation (


nom_type varchar (20),

)



drop table Document
create table Document (

Num_Document int   primary key ,
Note_Document varchar(200) ,
Num_Compte varchar(24) references Compte_Banque on update cascade on delete cascade ,
CIN_Ben varchar (10) ,
Nom_Ben_PC varchar(50),
Nom_Ben_Morale varchar(50),
RIB_Ben_Morale varchar(24) ,
OP_type  varchar (20),
date_doc date ,
doc_montant float ,

)

ALTER TABLE Document ADD DEFAULT '' FOR Note_Document
insert into Document values (1,'',1,'007590000935400000001631','HH112313','Choukri','','')
insert into Document values (1,'','007590000935400000001631','HH112313','Choukri','','',4)


SELECT * from Document where  Nom_Ben_PC like   '%Aymane%'







 drop proc PS_ajout_Document
 select * from Document
create proc PS_ajout_Document
@P_NUM int,
@P_NOTE varchar(200),
@P_NUMCMPT varchar(24),
@P_CIN varchar(10),
@P_NOM_PC varchar(50),
@P_NOM_MORALE varchar(50),
@P_RIB varchar(24),
@P_Type varchar(24),
@P_date datetime ,
@P_montant float ,
@p_etat char(50) output 

as 
begin 

insert into Document values (@P_NUM,@P_NOTE,@P_NUMCMPT,@P_CIN,@P_NOM_PC,@P_NOM_MORALE,@P_RIB,@P_Type,@P_date,@P_montant)
set @p_etat='Ajout avec Succes'
end

declare @NUM int
declare @NOTE varchar(200)
declare @NUMOP int 
declare @NUMCMPT varchar(24)
declare @CIN varchar(10)
declare @NOM_PC varchar(50)
declare @NOM_MORALE varchar(50)
declare @RIB varchar(24)
declare  @etat char(50) 
set @NUM=1
set @NOTE=''
set @NUMOP=1
set @NUMCMPT='007590000935400000001631'
set @CIN='hh11213'
set @NOM_PC='Hamid'
set @NOM_MORALE='rjakiwi'
set @RIB=''
exec  PS_ajout_Document @NUM,@NOTE,@NUMOP,@NUMCMPT,@CIN ,@NOM_PC,@NOM_MORALE,@RIB,  @etat output
print  @etat

select * from Document


create proc PS_ajouter_Document
@P_NUM int,
@P_NOTE text ,
@P_NUMCMPT varchar(24),
@P_CIN varchar(10),
@P_NOM_PC varchar(50),
@P_NOM_MORALE varchar(50),
@P_RIB varchar(24),
@P_DATEOP date,
@P_MONTANTOP float ,
@P_TYPEOP varchar(50),


@p_etat char(50) output 

as 
begin 

insert into Document values (@P_NUM,@P_NOTE,@P_NUMCMPT,@P_CIN,@P_NOM_PC,@P_NOM_MORALE,@P_RIB,@P_TYPEOP,@P_DATEOP,@P_MONTANTOP)
set @p_etat='Ajout avec Succes'

end
