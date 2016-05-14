# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.create!([
{name: 'France', poule: 'A', iso: 'fr'}, {name: 'Roumanie', poule: 'A', iso: 'ro'}, 
{name: 'Albanie', poule: 'A', iso: 'al'}, {name: 'Suisse', poule: 'A', iso: 'ch'}, 
{name: 'Pays de Galles', poule:  'B', iso: 'wales'}, {name: 'Slovaquie', poule: 'B', iso: 'sk'}, 
{name: 'Angleterre', poule: 'B', iso: 'england'}, {name: 'Russie', poule: 'B', iso: 'ru' },
{name: 'Turquie', poule: 'D', iso: 'tk'}, {name: 'Croatie', poule: 'D', iso: 'hr'},
{name: 'Pologne', poule: 'C', iso: 'pl'}, {name: 'Irlande du Nord', poule: 'C', iso: 'gb' },
{name: 'Allemagne', poule: 'C', iso: 'de'}, {name: 'Ukraine', poule: 'C', iso: 'ua'},
{name: 'Espagne', poule: 'D', iso: 'es'}, {name: 'Rép. Tchèque', poule: 'D', iso: 'cz'},
{name: 'République d\'Irlande', poule: 'E',  iso: 'ie'}, {name: 'Suède', poule: 'E',  iso: 'se'},
{name: 'Belgique', poule: 'E', iso: 'be'}, {name: 'Italie', poule: 'E', iso: 'it'},
{name: 'Autriche', poule: 'F',iso: 'at' }, {name: 'Hongrie', poule: 'F', iso: 'hu'},
{name: 'Portugal', poule: 'F', iso: 'pt'}, {name: 'Islande', poule: 'F', iso: 'is'}])

Match.create!([
{ host_name: 'France', guest_name: 'Roumanie', date: '2016-06-10 21:00:00 +0200', result: '' },
{ host_name: 'Albanie', guest_name: 'Suisse', date: '2016-06-11 15:00:00 +0200', result: '' },
{ host_name: 'Pays de Galles', guest_name: 'Slovaquie', date: '2016-06-11 18:00:00 +0200', result: '' },
{ host_name: 'Angleterre', guest_name: 'Russie', date: '2016-06-11 21:00:00 +0200', result: '' },
{ host_name: 'Turquie', guest_name: 'Croatie', date: '2016-06-12 15:00:00 +0200', result: '' },
{ host_name: 'Pologne', guest_name: 'Irlande du Nord', date: '2016-06-12 18:00:00 +0200', result: '' },
{ host_name: 'Allemagne', guest_name: 'Ukraine', date: '2016-06-12 21:00:00 +0200', result: '' },
{ host_name: 'Espagne', guest_name: 'Rép. Tchèque', date: '2016-06-13 15:00:00 +0200', result: '' },
{ host_name: 'République d\'Irlande', guest_name: 'Suède', date: '2016-06-13 18:00:00 +0200', result: '' },
{ host_name: 'Belgique', guest_name: 'Italie', date: '2016-06-13 21:00:00 +0200', result: '' },
{ host_name: 'Autriche', guest_name: 'Hongrie', date: '2016-06-14 18:00:00 +0200', result: '' },
{ host_name: 'Portugal', guest_name: 'Islande', date: '2016-06-14 21:00:00 +0200', result: '' },
{ host_name: 'Russie', guest_name: 'Slovaquie', date: '2016-06-15 15:00:00 +0200', result: '' },
{ host_name: 'Roumanie', guest_name: 'Suisse', date: '2016-06-15 18:00:00 +0200', result: '' },
{ host_name: 'France', guest_name: 'Albanie', date: '2016-06-15 21:00:00 +0200', result: '' },
{ host_name: 'Angleterre', guest_name: 'Pays de Galles', date: '2016-06-16 15:00:00 +0200', result: '' },
{ host_name: 'Ukraine', guest_name: 'Irlande du Nord', date: '2016-06-16 18:00:00 +0200', result: '' },
{ host_name: 'Allemagne', guest_name: 'Pologne', date: '2016-06-16 21:00:00 +0200', result: '' },
{ host_name: 'Italie', guest_name: 'Suède', date: '2016-06-17 15:00:00 +0200', result: '' },
{ host_name: 'Rép. Tchèque', guest_name: 'Croatie', date: '2016-06-17 18:00:00 +0200', result: '' },
{ host_name: 'Espagne', guest_name: 'Turquie', date: '2016-06-17 21:00:00 +0200', result: '' },
{ host_name: 'Belgique', guest_name: 'République d\'Irlande', date: '2016-06-18 15:00:00 +0200', result: '' },
{ host_name: 'Islande', guest_name: 'Hongrie', date: '2016-06-18 18:00:00 +0200', result: '' },
{ host_name: 'Portugal', guest_name: 'Autriche', date: '2016-06-18 21:00:00 +0200', result: '' },
{ host_name: 'Roumanie', guest_name: 'Albanie', date: '2016-06-19 21:00:00 +0200', result: '' },
{ host_name: 'Suisse', guest_name: 'France', date: '2016-06-19 21:00:00 +0200', result: '' },
{ host_name: 'Russie', guest_name: 'Pays de Galles', date: '2016-06-20 21:00:00 +0200', result: '' },
{ host_name: 'Slovaquie', guest_name: 'Angleterre', date: '2016-06-20 21:00:00 +0200', result: '' },
{ host_name: 'Ukraine', guest_name: 'Pologne', date: '2016-06-21 18:00:00 +0200', result: '' },
{ host_name: 'Irlande du Nord', guest_name: 'Allemagne', date: '2016-06-21 18:00:00 +0200', result: '' },
{ host_name: 'Rép. Tchèque', guest_name: 'Turquie', date: '2016-06-21 21:00:00 +0200', result: '' },
{ host_name: 'Croatie', guest_name: 'Espagne', date: '2016-06-21 21:00:00 +0200', result: '' },
{ host_name: 'Islande', guest_name: 'Autriche', date: '2016-06-22 18:00:00 +0200', result: '' },
{ host_name: 'Hongrie', guest_name: 'Portugal', date: '2016-06-22 18:00:00 +0200', result: '' },
{ host_name: 'Italie', guest_name: 'République d\'Irlande', date: '2016-06-22 21:00:00 +0200', result: '' },
{ host_name: 'Suède', guest_name: 'Belgique', date: '2016-06-22 21:00:00 +0200', result: ''}
])

player = Player.create(name: "Jejej", email: "jerome@gmail.com", password:"azerty", password_confirmation:"azerty")
yuriko = Player.create(name: "Yuriko", email: "yuriko@gmail.com", password:"azerty", password_confirmation:"azerty")

Event.create!( name: 'Le Clan', password: '123', owner_player: player )
Event.create!( name: 'YURIKO OPEN EVENT', owner_player: yuriko )



