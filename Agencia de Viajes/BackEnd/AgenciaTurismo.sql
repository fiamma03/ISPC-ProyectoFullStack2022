create database agenciaturismo;
use agenciaturismo;
create table cliente (DNICliente int not null,
			PassCliente  varchar (45) not null,
            EmailCliente varchar (45),
            NameCliente varchar (45) not null,
            LNameCliente varchar (45) not null,
            HistCompras varchar (45),
            Resenia varchar (45),
            Consulta varchar (45),
            primary key (DNICliente))
            engine =Innodb;
            
create table Vendedor (DNIVen int NOT NULL,
			PassVen varchar (45) not null,
            EmailVen varchar (45),
            NameVen varchar (45) not null,
            LNameVen varchar (45)not null,
            HistPublic varchar (45),
            Consulta varchar (45),
            primary key (DNIVen))
            engine = InnoDB;
            
create table Adm (DNIAdm int not null,
			PassAdm varchar(45) not null,
            EmailAdm varchar (45),
            NameAdm varchar (45) not null,
            LName varchar (45) not null,
             primary key (DNIAdm))
             engine = InnoDB;

create table SerAtCliente (DNISAT int not null,
			PassSAT varchar (45) not null,            
			EmailSAT varchar (45),   
            NameSAT varchar (45) not null,   
            LNameSAT varchar (45) not null,   
            Consulta varchar (45),
             primary key (DNISAT))
             engine = InnoDB;

create table Compra (idcompra int not null,
			publicacion varchar (200),   
            Usuario varchar (45),  
            compra_cliente varchar (45),
            compra_public varchar (45),
            primary key (idcompra,compra_cliente, compra_public),
			foreign key (compra_cliente) references cliente (HistCompras))
            engine = innoDB;
            
alter table `agenciaturismo`. `cliente` add index `compras`(`HistCompras`); 
alter table `agenciaturismo`. `cliente` add index `resenia`(`resenia`); 


create table Resenia (idresenia int not null,
			Titulo varchar (45),   
            Descripcion varchar (200),   
            Calificacion decimal (6),
            Resenia_cliente varchar (45),   
            primary key (idresenia),
            foreign key (resenia_cliente) references cliente (resenia)
            );
 
 alter table `agenciaturismo`. `vendedor` add index `publicacion`(`HistPublic`); 
 alter table `agenciaturismo`. `resenia` add index `reseniadepublic`(`resenia_cliente`); 
 alter table `agenciaturismo`. `compra` add index `publiccompra`(`publicacion`); 
 
create table Publicaciones (idPublic int not null,
			titulo varchar (45),
            Descripcion varchar (200),
            calificacion decimal (6),
            precio int,
            fotos int,
            resenia varchar (45),
            resenia_cliente varchar (45),
            Public_compras varchar (45),
            Public_Ven varchar (45),
            primary key (idPublic),
            foreign key (Public_compras) references compra (publicacion),
            foreign key (resenia) references resenia (titulo),
            foreign key (Public_Ven) references vendedor (HistPublic)
            );
alter table `agenciaturismo`. `vendedor` add index `consulta`(`consulta`); 
 alter table `agenciaturismo`. `cliente` add index `consulta`(`consulta`); 
 alter table adm drop consulta;
 alter table `agenciaturismo`. `SerAtCliente` add index `consulta`(`consulta`);     
 
create table Consulta (idConsulta int not null,
			Asunto varchar (45),
            Descripcion varchar (200),
            consulta_cliente varchar (45),
            consulta_ven varchar (45),
            primary key (idConsulta),
            foreign key (Asunto) references SerAtCliente (consulta),
            foreign key (consulta_cliente) references cliente (consulta),
            foreign key (consulta_ven) references cliente (consulta)
            );
            
alter table cliente add usuario varchar (45);
alter table adm add Adm_public varchar (45);
alter table adm add adm_resenia varchar (45);
alter table publicaciones add Adm_public varchar (45);
alter table resenia add resenia_adm varchar (45);
alter table `agenciaturismo`. `adm` add index `Adm_public`(`Adm_public`); 
alter table `agenciaturismo`. `adm` add index `adm_resenia`(`adm_resenia`); 
alter table publicaciones add constraint  foreign key (Adm_public) references Adm (Adm_public);
alter table resenia add constraint foreign key (resenia_adm) references Adm (adm_resenia);    
alter table publicaciones add seleccion varchar (45);    
  
alter table `agenciaturismo`. `consulta`  add index `consulta_ven`(`consulta_ven`);
alter table consulta add constraint foreign key (consulta_ven) references Vendedor (consulta);   

alter table cliente add HistComp_Adm varchar (45);
alter table adm add Adm_HistComp varchar (45);
alter table adm add Adm_ven varchar (45);
alter table adm add adm_HistPublic varchar (45);
alter table vendedor add HistComp_Ven varchar (45);
alter table vendedor add Ven_Adm varchar (45);
alter table vendedor drop HistComp_Ven;
alter table vendedor add HistPublic_Ven varchar (45);

alter table `agenciaturismo`. `adm`  add index `adm_HistPublic`(`adm_HistPublic`);
alter table vendedor add constraint foreign key (HistPublic_Ven) references adm (adm_HistPublic);
 
alter table `agenciaturismo`. `adm`  add index `Adm_HistComp`(`Adm_HistComp`);
alter table cliente add constraint foreign key (HistComp_Adm) references adm (Adm_HistComp);   


alter table `agenciaturismo`. `adm`  add index `Adm_ven`(`Adm_ven`);
alter table vendedor add constraint foreign key (Ven_Adm) references adm (adm_ven);
 
alter table SerAtCliente add SAT_HistComp varchar (45);
alter table SerAtCliente add SAT_HistPubli varchar (45);
alter table cliente add HistComp_SAT varchar (45);
alter table vendedor add HistPublic_SAT varchar (45);

alter table `agenciaturismo`. `SerAtCliente`  add index `SAT_HistComp`(`SAT_HistComp`);
alter table cliente add constraint foreign key (HistComp_SAT) references SerAtCliente (SAT_HistComp);   

alter table `agenciaturismo`. `SerAtCliente`  add index `SAT_HistPubli`(`SAT_HistPubli`);
alter table vendedor add constraint foreign key (HistPublic_SAT) references SerAtCliente (SAT_HistPubli);   

