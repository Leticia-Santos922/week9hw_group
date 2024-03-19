use library_db;

create table Publication (
    Publication_ID varchar(12) primary key,
    Publisher varchar(50),
    Year_Published int
);

insert into  Publication (Publication_ID, Publisher, Year_Published)
values
('01', 'Scribner', 1925),
('02', 'J. B. Lippincott & Co.', 1960),
('03', 'Crown Publishing Group', 2012),
('04', 'Doubleday', 2003),
('05', 'T. Egerton, Whitehall', 1813),
('06', 'Delacorte Press', 1991),
('07', 'Chilton Books', 1965),
('08', 'Secker & Warburg', 1949),
('09', 'Bloomsbury Publishing', 1997),
('10', 'Allen & Unwin', 1937),
('11', 'Riverhead Books', 2015),
('12', 'Celadon Books', 2019),
('13', 'Simon & Schuster', 2011),
('14', 'Crown Publishing', 2018),
('15', 'Harper', 2011),
('16', 'Harper', 1980),
('17', 'HarperOne', 2016),
('18', 'Running Press', 2013),
('19', 'Viking', 2006),
('20', 'Knopf', 2012);

select * from publication;