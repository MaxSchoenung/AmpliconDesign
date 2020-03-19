/* Recreate the schema */
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

/* Insert tables */
CREATE TABLE cgi (
    chromosome varchar(64),
	"start" int,
    "end" int,
    genome varchar(4),
	PRIMARY KEY (chromosome, "start", "end", genome));
CREATE INDEX cgi_index on cgi(chromosome, "start", "end" DESC);
CREATE INDEX cgi_index_asc on cgi(chromosome, "start", "end" ASC);


CREATE TABLE genes (
    chromosome varchar(64),
	"start" int,
    "end" int,
	strand varchar(2),
	gene varchar(64),
    genome varchar(4),
	PRIMARY KEY (chromosome, "start", "end", gene, genome));
CREATE INDEX genes_index on genes(chromosome, "start", "end" DESC);
CREATE INDEX genes_index_asc on genes(chromosome, "start", "end" ASC);


CREATE TABLE repeats (
    chromosome varchar(64),
	"start" int,
    "end" int,
	strand varchar(2),
    genome varchar(4),
	PRIMARY KEY (chromosome, "start", "end", strand, genome));
CREATE INDEX repeats_index on repeats(chromosome, "start", "end" DESC);
CREATE INDEX repeats_index_asc on repeats(chromosome, "start", "end" ASC);

CREATE TABLE snp (
    chromosome varchar(64),
	"start" int,
    "end" int,
	strand varchar(2),
    genome varchar(4),
	PRIMARY KEY (chromosome, "start", "end", strand, genome));
CREATE INDEX snp_index on snp(chromosome, "start", "end" DESC);
CREATE INDEX snp_index_asc on snp(chromosome, "start", "end" ASC);

CREATE TABLE hm450k (
    seqnames varchar(8),
	"start" int,
    "end" int,
	strand varchar(32),
	PRIMARY KEY (seqnames, "start", "end", strand));
CREATE INDEX hm450k_index on hm450k(seqnames, "start", "end" DESC);
CREATE INDEX hm450k_index_asc on hm450k(seqnames, "start", "end" ASC);

CREATE TABLE hm850k (
    seqnames varchar(8),
	"start" int,
    "end" int,
	strand varchar(32),
	PRIMARY KEY (seqnames, "start", "end", strand));
CREATE INDEX hm850k_index on hm850k(seqnames, "start", "end" DESC);
CREATE INDEX hm850k_index_asc on hm850k(seqnames, "start", "end" ASC);


