-- schema for the database 
--creating the tables

create schema wave_db
set search_path to wave_db;


CREATE TABLE users (
u_id serial PRIMARY KEY,
name text NOT NULL,
mobile text NOT NULL,
wallet_id integer NOT NULL,
when_created timestamp without time zone NOT null
);


CREATE TABLE transfers (
transfer_id serial PRIMARY KEY,
u_id integer NOT NULL,
source_wallet_id integer NOT NULL,
dest_wallet_id integer NOT NULL,
send_amount_currency text NOT NULL,
send_amount_scalar numeric NOT NULL,
receive_amount_currency text NOT NULL,
receive_amount_scalar numeric NOT NULL,
kind text NOT NULL,dest_mobile text,
dest_merchant_id integer,
when_created timestamp without time zone NOT NULL
);


CREATE TABLE agents (
agent_id serial PRIMARY KEY,
name text,country text NOT NULL,
region text,
city text,
subcity text,
when_created timestamp without time zone NOT NULL
);

CREATE TABLE agent_transactions (
atx_id serial PRIMARY KEY,
u_id integer NOT NULL,
agent_id integer NOT NULL,
amount numeric NOT NULL,
fee_amount_scalar numeric NOT NULL,
when_created timestamp without time zone NOT NULL
);

CREATE TABLE wallets (
wallet_id serial PRIMARY KEY,
currency text NOT NULL,
ledger_location text NOT NULL,
when_created timestamp without time zone NOT null
);

--ANSWERS

--Question 1(How many users does Wave have?)
select count(*)
from users;

--Question 2(How many transfers have been sent in the currency CFA?)
select count u_id
from transfers
where send_amount_currency = "CFA";

--Question 3(How many different users have sent a transfer in CFA?)
select count( distinct u_id)
from transfers
where send_amount_currency = "CFA";

--Question 4(How many agent_transactions did we have in the months of 2018 (broken down bymonth)?)
select DATE_TRUNC('month', when_created), count(atx_id)
from agent_transactions
where when_created >= "2018-01-01" and when_created <= "2018-12-31"
group by 1

--Question 5(Over the course of the last week, how many Wave agents were “net depositors” vs. “netwithdrawers”?)
