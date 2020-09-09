USE master
GO

--drop database if it exists
IF DB_ID('foodies_galore') IS NOT NULL
BEGIN
	ALTER DATABASE foodies_galore SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE foodies_galore;
END

CREATE DATABASE foodies_galore
GO

USE foodies_galore
GO

--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

--populate default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

GO

CREATE TABLE restaurant_type (
	type_id int IDENTITY (2, 2) NOT NULL PRIMARY KEY,
	type varchar(30) NOT NULL
)

INSERT INTO restaurant_type (type)
VALUES ('American')

INSERT INTO restaurant_type (type)
VALUES ('Mexican')

INSERT INTO restaurant_type (type)
VALUES ('Greek')

INSERT INTO restaurant_type (type)
VALUES ('Thai')

INSERT INTO restaurant_type (type)
VALUES ('Japanese')

INSERT INTO restaurant_type (type)
VALUES ('Chinese')

INSERT INTO restaurant_type (type)
VALUES ('Italian')

INSERT INTO restaurant_type (type)
VALUES ('British')

INSERT INTO restaurant_type (type)
VALUES ('Indian');

CREATE TABLE restaurants (
	restaurant_id int IDENTITY (10,10) NOT NULL PRIMARY KEY,
	restaurant_name varchar(80) NOT NULL,
	location_zip varchar(9),
	image_source varchar(50)
)

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Yummy Bowl', '45069', 'yummybowl.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Chick Fil A', '45239', 'chickfila.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bob Evans', '45040', 'bobevans.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Skyline', '45239', 'betterchili.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Miyako Sushi&Grill', '45069', 'miyako.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('El Rancho Grande', '45040', 'elranchogrande.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Banana Leaf', '45040', 'bananaleaf.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bawarchi', '45069', 'bawarchi.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Fox and Hound', '45239', 'foxandhound.jpg');

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Olive Garden', '45069', 'olivegarden.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Cheesecake Factory', '45069', 'cheesecakefactory.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Qdoba', '45040', 'qdoba.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Acapulco', '45239', 'acapulcos.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Kyoto', '45069', 'kyoto.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Roll On In', '45040', 'rollonin.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Piada', '45040', 'piada.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Carraba''s', '45239', 'carrabas.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Tasty Pot', '45040', 'tastypot.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Thai Koon Kitchen', '45069', 'thaikoon.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bangkok Express', '45040', 'bangkokexpress.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('P.F. Chang''s', '45069', 'pfchangs.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Gyro Express', '45040', 'gyroexpress.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Santorini', '45239', 'santorini.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('The Pub Rookwood', '45239', 'pubatrookwoodmews.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Cock and Bull Public House', '45069', 'cockandbull.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bamboo House', '45040', 'bamboohouse.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Wingstop', '45239', 'wingstop.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('La PiNata', '45239', 'lapinata.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Hook Fish & Chicken', '45069', 'hookfishandchicken.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Biagio''s Bistro', '45040', 'biagiosbistro.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('McDonald''s', '45239', 'mcdonalds.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Taco Bell', '45040', 'tacobell.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('The Old Bag of Nails Pub', '45069', 'oldbagofnailspub.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Godavari', '45040', 'godavari.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Raja India', '45239', 'rajaindia.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Basil Thai Bistro', '45040', 'basilthaibistro.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Red Squirrel', '45239', 'redsquirrel.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Los Panchos', '45040', 'lospanchos.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Fusabowl', '45069', 'fusabowl.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Tag''s Cafe', '45239', 'tagscafe.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Sichuan Bistro', '45040', 'sichuanbistro.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Rusty Bucket', '45239', 'rustybucket.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('China Chef', '45040', 'chinachef.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Pitrelli''s', '45239', 'pitrellis.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Taziki''s Mediterranean Cafe', '45040', 'tazikis.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Kabuto', '45239', 'kabuto.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Panda Express', '45040', 'pandaexpress.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Thai Taste of West Chester', '45069', 'thaitaste.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Dancing Roll', '45040', 'dancingroll.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Tikka Grill', '45069', 'tikkagrill.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Soho Japanese Bistro', '45040', 'sohobistro.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Indian Fusion', '45069', 'indianfusion.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Mi Burrito', '45040', 'miburrito.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Greek Isles', '45239', 'greekisles.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bucks Tavern', '45239', 'buckstavern.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Chuy''s', '45040', 'chuys.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('New Krishna', '45239', 'newkrishna.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Maggiano''s Little Italy', '45040', 'maggianos.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Mazunte Taqueria', '45239', 'mazuntetaqueria.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('The Eagle', '45069', 'eagle.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Oriental Wok', '45040', 'orientalwok.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Nicholson''s Tavern', '45239', 'nicholsons.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Sebastian''s', '45069', 'sebastians.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Buddha Barn', '45040', 'buddhabarn.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Arlin''s', '45239', 'arlins.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Montgomery Inn', '45069', 'montgomeryinn.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Buca Di Beppo', '45040', 'buca.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Swagat India House', '45069', 'swagat.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Thai Spicy', '45040', 'thaispicy.jpg')

INSERT INTO restaurants (restaurant_name, location_zip, image_source)
VALUES ('Bravo!', '45239', 'bravo.jpg')





CREATE TABLE restaurant_details (
	restaurant_id int NOT NULL PRIMARY KEY,
	restaurant_description varchar(400),
	restaurant_phonenumber varchar(12),
	covid_message varchar(400),
	map_url varchar(340)
)

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (10, 'We are a local and family owned business, dedicated to serving authentic Chinese food, fast and fresh.',
'513-870-9500','During these uncertain times, the health and safety of our guests is our top priority. We have begun
sanitizing as well as social distancing all seating. Masks will be provided at the door if you do not have your own,
and each staff member will be wearing a mask and gloves.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.3823991360287!2d-84.4316842485506!3d39.32492087940628!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884050251a956b9f%3A0xfb73f91d4aff6fea!2sYummy%20Bowl!5e0!3m2!1sen!2sus!4v1597247399512!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (20, 'We should be about more than just selling chicken. We should be a part of our customers lives and the communities in which we serve.', '513-245-0934',
'As states and local communities begin to reopen for business, we are sharing our commitment to safe service and our approach to expanding the levels of service
offered at restaurants. We want guests to know - no mater which restaurant you visit - you will continue to receive the high-quality food, service and hospitality
that you have come to expect from Chick-fil-A.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d235208.46221204248!2d-84.71730365727637!3d39.23366548061755!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404a64c64cc64b%3A0x18c4d0d52e50401c!2sChick-fil-A!5e0!3m2!1sen!2sus!4v1597248048544!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (30, 'Bob Evans is a chain of family style restaurants. Our success is built on the basics: high-quality food and heartfelt hospitality.',
'513-770-0163', 'At Bob Evans Restaurants, we are taking precautions to adhere to social distancing guidelines, going above and beyond with cleaning
and safety procedures and making it easy to get you your favorite meals while protecting you and our employees.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.562142832406!2d-84.3156849485507!3d39.320847579407!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405709bb7c438b%3A0x172d23649c17cfef!2sBob%20Evans!5e0!3m2!1sen!2sus!4v1597248139726!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (40, 'Skyline is famous for our incredibly delicious Cheese Coneys and 3-Ways. Our unique chili is still made with the original secret
family recipe passed down through generations.', '513-729-2200', 'Please know our neighborhood Skyline is prepared to serve you our delicious
food and hospitality in a clean and wholesome environment. Thank you for your patronage of Skyline Chili. All the best to you and your
families during this time.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3092.3669150594246!2d-84.60232794855371!3d39.1891107794263!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841b55149badfcd%3A0xf2bd32c29f552850!2sSkyline%20Chili!5e0!3m2!1sen!2sus!4v1597248191017!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (50, 'Miyako distinguishes itself from other Japanese restaurants in numerous different ways, mst remarkably the sushi bar, which is the
largest in town and one that makes impressively skilled and tasty sushi in fantastic and brilliant combinations with fresh ingredients.', '513-777-3888',
'The new way of Miyako is here! Everyone is adapting to the new life after COVID-19, and so are we! We are continuously developing a way for all of
our beloved customers to enjoy our food.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3085.101722574831!2d-84.36620204854995!3d39.35393297940217!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405a063cdba4ef%3A0xf2d79d76a4685df4!2sMiyako%20Sushi%20%26%20Grill!5e0!3m2!1sen!2sus!4v1597248519950!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (60, 'El Rancho Grande offers fresh, homemade dishes made to order. Our menu includes an amazing selection of seafood, chicken, steak
and unique entrees sure to satisfy any palate. Try our fajitas, chimichangas, chile rellenos, burritos and more!', '513-229-0595', 'We are very grateful
to have found continued support and patronage during this time. We would like to ensure to all guests that we have been taking the necessary steps
such as mask requirements and santizing, as well as social distancing.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.4677873901073!2d-84.31335924855065!3d39.32298587940671!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884057a0bdd0c2bf%3A0x9bb8d204f03c0e9!2sEl%20Rancho%20Grande%20Mexican%20Restaurant!5e0!3m2!1sen!2sus!4v1597248626230!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (70, 'Each dish is made from scratch and presented as a work of art. Menu favorites include Curry, Spring Rolls, and of course the wildly
popular Pad thai.', '513-234-0779', 'During these difficult times, we continue to enforce social distancing, mask requirements, and proper
sanitation of the entire restaurant. We look forward to welcoming you back!',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3084.8272277595493!2d-84.31112204854982!3d39.360148979401394!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884058324d0f7acb%3A0xe169db84cead13b0!2sBanana%20Leaf%20Modern%20Thai!5e0!3m2!1sen!2sus!4v1597248676404!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (80, 'We offer an extensive menu of regional Indian dishes in an easygoing space with catering and delivery options.', '513-466-8212', 'Bawarchi
Biryanis would like to share with our guests and community members, who have been very supportive of us, the actions we are taking to keep our restaurant
safe and clean for our customers, for our employees, and the community at large which includes regularly disinfecing, limiting dining to the patio area,
using disposable-ware for serving and dining.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.635941209766!2d-84.31584504855078!3d39.31917507940705!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884057c20c730595%3A0x72d1ae1af2cc8fd1!2sBawarchi%20Indian%20Cuisine%20-%20Cincinnati!5e0!3m2!1sen!2sus!4v1597248735457!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (90, 'This is your bar. This place is not about pleasing the status quo or knocking the rust off old pick-up lines. It is all about hanging
out with friends, playing games, and having a good drink.', '513-229-7921', 'Our promise to you is to continue to be a leader in safe sanitation
practices with all team members certified in safe food handling, as well as adhering to all mask-requirements and providing our guests with a mask
if you do not have one. Tables will be separated and patrons will be socially distanced around the bar.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.9757151548365!2d-84.31663404855091!3d39.311473979408454!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405707a82245a1%3A0x2d0d2e48ae37ee22!2sFox%20%26%20Hound!5e0!3m2!1sen!2sus!4v1597248838243!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (100, 'Italian generosity is always on the table. At Olive Garden, we know that life is better together and everyone is happiest when with family.',
'513-677-5922', 'The health and safety of our guests and team members has always been our first
priority. While our dining rooms were closed, we took great care to continue serving ToGo orders. But now that we will be reopening dine-in, we will be
requiring face coverings, and will be temperature checking all staff, social distancing and sanitizing all areas multiple times a day.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d98783.25268258718!2d-84.38466184318794!3d39.311452872228664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404efc8bdc2553%3A0xb8273d19d63635b8!2sOlive%20Garden%20Italian%20Restaurant!5e0!3m2!1sen!2sus!4v1597248912222!5m2!1sen!2sus');

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (110, 'Our story begins in Detroit in the 1940s. Evelyn Overton found a recipe in the local paper that would inspire her "Original" Cheesecake.
Everyone loved her recipe so much that she decided to open a small cheesecake shop, which would one day grow into The Cheesecake Factory', '513-755-2761',
'The health and wellbeing of our staff members and guests is our top priority, and we are approaching the reopening of our dining rooms with that as our
guiding principle.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3084.3512888961864!2d-84.37377224854964!3d39.37092477939984!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405a1568bd64c3%3A0x1ad8f646ec8667e0!2sThe%20Cheesecake%20Factory!5e0!3m2!1sen!2sus!4v1597249004821!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (120, 'At Qdoba, our mission is to bring flavor to peoples lives through our communities, our people, our restaurants, and our food. We believe
every individual makes a difference, and that even the smallest detail or act of kindness can make someones life a little more flavorful.', '513-770-0310',
'As COVID-19 continues to impact all of us, our teams are continuing to work hard serving you freshly prepared, flavorful meals. We are working to safely
welcome you back into our restaurants',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3087.1037506944867!2d-84.31720684855094!3d39.30857167940881!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405701b633396d%3A0xd064d807e88b57e!2sQDOBA%20Mexican%20Eats!5e0!3m2!1sen!2sus!4v1597249091207!5m2!1sen!2sus')

INSERT INTO restaurant_details(restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (130, 'Authentic Mexican cuisine your whole family will love!', '513-874-5777', 'As we continue to monitor the developemtns around COVID-19 news, our locations
have adjusted their services in order to continue serving our community as best we can.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d197988.56573403772!2d-84.73671620180505!3d39.16173033874699!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404f1faa66b6d3%3A0xee0e5194f97068b8!2sAcapulco!5e0!3m2!1sen!2sus!4v1597330720121!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (140, 'Kyoto Japanese Cuisine brings to the area the delicacy and quality of the cuisine from Japan.', '513-583-8897', 'We are currently open carry out only,
full menu is available. Our staff will wear masks and gloves and we will make sure to clean all surfaces and doors thoroughly every 30 minutes.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3087.9658464902363!2d-84.30293254855141!3d39.28902507941155!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884056437afc391b%3A0xc546b9f5a220f5c3!2sKyoto%20Japanese%20Cuisine%20-%20USA!5e0!3m2!1sen!2sus!4v1597256553587!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (150, 'We offer a menu that explores the edge of multi-cultural boundaries, bringing sushi burritos, sushi tacos, sushi bowls and even sushi donuts
to a whole new level. Our food is fast, fresh and affordable and takes sushi to a whole other level.', '513-480-1335', 'Our number one priority is you! And due to that,
our entire staff will be wearing masks as well as gloves that will be changed frequently, and sanitizing surfaces often.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3085.4080655125267!2d-84.21981848255616!3d39.3469948!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840f7e7e7629c61%3A0xec0e02c35f4282c0!2sRoll%20On%20In%20Maineville%20-%20Hibachi%2C%20Sushi%20Burritos%2C%20%26%20Bowls!5e0!3m2!1sen!2sus!4v1597256621860!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (160, 'Piada started as an idea scribbled on a napkin during a visit to Rimini, Italy. Our chefs found distinct charm
in the family operated food carts and corner markets scattered throughout the streets of the city.', '513-492-9931', 'While our dining rooms
are reopening as local restrictions ease, we continue to offer in-store carry out, online, Curbside or Drive Thru Pick up.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3087.29637801656!2d-84.31812724855104!3d39.30420487940939!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884056f92a6841fb%3A0x3af7baff5cb23572!2sPiada%20Italian%20Street%20Food!5e0!3m2!1sen!2sus!4v1597256665539!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (170, 'We are two Sicilian boys from Texas who love to cook and eat. We love the Sicilian food our parents and grandparents cooked.',
'513-339-0900', 'Our dining rooms are starting to safely open at limited capacity and hours to comply with regulations. We are happy to welcome you back and want
to ensure the safety of your visit.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3087.5024616283945!2d-84.31803974855114!3d39.299532579410226!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884056f9b3f70451%3A0xb29ffae3fe32a950!2sCarrabbas%20Italian%20Grill!5e0!3m2!1sen!2sus!4v1597256743523!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (180, 'At tasty pot, we firmly believe that in order to live well, you must eat well. It is our mission to provide healthy dining in a comfortable modern
setting with excellent service.', '513-580-8888', 'Due to the COVID-19 pandemic, we are committed to the health and safety of our guests and staffs. Due to this,
we will remain carry-out and delivery only, as well as masking up and sanitizing all areas.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3087.7662961306924!2d-84.39635404855127!3d39.29355027941107!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405189ac9704c7%3A0x850ef672a8bc174!2sTasty%20Pot%20Ohio!5e0!3m2!1sen!2sus!4v1597256851049!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (190, 'Unpretentious bistro featuring familiar Thai dishes such as red curry, pad thai and fried rice.', '513-860-0143', 'Due to the current public situation,
we are strictly carry out as of now. We will be taking safety and cleanliness precautions to ensure the safety of our guests.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.3199641940028!2d-84.4326239485506!3d39.32633567940626!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405024601ac3a7%3A0xa8aa5d54ee7702cb!2sThai%20Koon%20Kitchen!5e0!3m2!1sen!2sus!4v1597256888608!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (200, 'Our Thai restaurant is known for its modern interpretation of classic dishes and its insistence on only using high quality fresh ingredients',
'513-381-2100', 'We are open for takeout and delivery during this time. We will be following regulations as far as cleanliness and social distancing.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d98954.7307176235!2d-84.49062541724412!3d39.189828481413066!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840569a3552bfe7%3A0xba070cb251cf315d!2sBangkok%20Express-Montgomery%20Road!5e0!3m2!1sen!2sus!4v1597256973925!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (210, 'P.F. Changs is an Asian restaurant concept founded on making food from scratch every day in every restaurant. Created in 1993, we are the first
multi-unit restaurant concept in the US to honor and celebrate the 2,000 year old tradition of wok cooking as the center of every guest experience.', '513-531-4567',
'Our team members are ready to serve you, your friends and your family! Reservations are now being accepted at select dining rooms and we could not be more excited.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.648212003301!2d-84.42506304855075!3d39.31889697940737!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884050374b51a1d7%3A0x5856297e1b85a10e!2sP.F.%20Changs!5e0!3m2!1sen!2sus!4v1597257031363!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (220, 'Come to Gyro Express for some traditional Mediterranean cuisine.', '513-832-1845', 'For the safety of our staff and guests, we are currently
delivery and takeout only.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3089.294129932977!2d-84.34378504855209!3d39.25889247941594!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840541b034e1bdb%3A0x8c429ae08b2f07aa!2sGyro%20Express!5e0!3m2!1sen!2sus!4v1597257083716!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (230, 'A family restaurant serving Greek food as well as daily specials and soup. We serve breakfast, lunch and dinner all day long.',
'513-662-8080', 'Starting May 26th we will be reopening our dining room, sanitizing all spaces, and wearing protective gear.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3093.837830233753!2d-84.60917404855441!3d39.155669979431245!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841ca801407e353%3A0x18e4c29ff302aa6c!2sSantorini!5e0!3m2!1sen!2sus!4v1597257141042!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (240, 'If you were looking for a great place with British vibes, this is the place.', '513-841-2748', 'Beginning Friday, May 15th, our patios will be reopening,
and the 21st our dining rooms. We will be wearing masks, gloves, and following proper sanitization as well as social distancing guidelines.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3094.1838924405315!2d-84.44701694855456!3d39.147798879432436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841b27df170ed7b%3A0x5a06cd73e24fd0e6!2sThe%20Pub%20Rookwood!5e0!3m2!1sen!2sus!4v1597257181577!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (250, 'Voted best fix & chips in the city four locations.', '513-771-4253', 'We are now open for limited inside and outside seating!
We have been working overtime preparing for your return; cleaning, sanitizing and developing new protocols to safely once again serve our guests.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3088.7202304212856!2d-84.46110704855174!3d39.271913979414194!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404de00206e225%3A0x18e1f460ea687f2a!2sCock%20%26%20Bull%20Public%20House%20Glendale%20Village!5e0!3m2!1sen!2sus!4v1597257264333!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (260, 'Bamboo House is a hidden jewel just waiting to be discovered by your taste buds.', '513-574-8555', 'Staff will be wearing masks and gloves,
sanitizing and social distancing in order to adhere to guidelines.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3092.233846123145!2d-84.6622628485536!3d39.192134879425865!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841cb31e52595cb%3A0x441a881406cd6ea!2sBambooHouse!5e0!3m2!1sen!2sus!4v1597257298664!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (270, 'What began as a small buffalo-style chicken wing restaurant in Garland, Texas, continues to soar to great heights. Today there are more than
1,400 restaurants across the world.', '513-481-9464', 'During these uncertain times, we will be taking the time and effort to ensure the safety of our staff
and guests through mask-wearing, glove usage and proper sanitization.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d98951.5127725426!2d-84.7302906460462!3d39.1921137901201!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404a63706333f3%3A0xf55b7f43fd01b6ba!2sWingstop!5e0!3m2!1sen!2sus!4v1597257359892!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (280, 'Our mission over the years has been very simple. To showcase the best Mexico has to offer and to impact the hearts of Americans one
delicious taco at a time.', '513-923-2733', 'Like many of you, we here at La Pinata are excited to open our dine in area back up and try to return back to normality.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d49404.0047120834!2d-84.61841030491846!3d39.293913129075285!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404a769ebc9165%3A0x13aa76c0ad86159a!2sLa%20Pi%C3%B1ata%20Mexican%20Grill%20%26%20Bar!5e0!3m2!1sen!2sus!4v1597257426287!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (290, 'We provide the best food in the state! Come get a taste of Britain.', '513-771-1868', 'We are working diligently to ensure the safety of our
guests and staff with masks, gloves, sanitation and social distancing.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3085.1520515166594!2d-84.37169844854995!3d39.35279317940234!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405a098386aaab%3A0x6776d4a5d5954ec1!2sHook%20Fish%20%26%20Chicken!5e0!3m2!1sen!2sus!4v1597257468957!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (300, 'Charming neighborhood hangout serving up classic Italian cuisine, desserts, wine and cocktails.', '513-861-4777',
'There have been service changes such as limiting the number of guests per table and in the restaurant as a total. We are doing everything we can
to comply with regulations and also deliver an impeccable experience.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3094.36370864942!2d-84.52190034855464!3d39.143708479433!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841b3871dea3e53%3A0xd9b766bbeb9553d1!2sBiagios%20Bistro!5e0!3m2!1sen!2sus!4v1597257494952!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (310, 'Back in 1954, a man named Ray Kroc discovered a small burger restaurant in California, and wrote the first page of our history.
From humble beginnings as a small restaurant, we are proud to have become one of the leading food service brands in the world with more than 36,000
restaurants in more than 100 countries.', '513-741-0266', 'At Mcdonalds, the safety of our customers and crew is a top priority. Today, more than ever,
we remain committed to following state and local health guidelines and will continue implementing coronavirus safety measures to help protect restaurant
crew and customers.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d99019.66833223964!2d-84.58992814720402!3d39.143687397484584!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841b556cca06f8b%3A0xa27ff91047a3f25a!2sMcDonalds!5e0!3m2!1sen!2sus!4v1597257570354!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (320, 'We are open early with breakfast hours and if you find yourself out and about late at night, you can still order at our drive thru. We are serving
all your favorite menu items, from classic burritos and tacos to some new favorites like Crunchwrap Supreme.','513-398-9755', 'Taco Bell is monitoring and following
guidelines from health authorities worldwide regarding the novel Coronavirus (COVID-19) to keep its customers and employees safe and healthy.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3084.9614194574247!2d-84.26165094854986!3d39.357110279401894!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840f7ef8bc634d3%3A0x3bb248aaad5bafab!2sTaco%20Bell!5e0!3m2!1sen!2sus!4v1597257601912!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (330, 'I called my pub "The Old Bag of Nails" because the first one was in an empty hardware store. And every day people stop by for great food, great
spirits, and an occasional hammer.', '513-492-7941', 'Patio and dine-in seating is available as we adjust to our new normal, wearing masks and sanitizing. But we are not
gonna let this stop us from enjoying the pub!',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3084.81079489589!2d-84.27960504854978!3d39.360521079401266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840580f017e2921%3A0x509b49df24e9b5ff!2sThe%20Old%20Bag%20of%20Nails%20Pub!5e0!3m2!1sen!2sus!4v1597257646508!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (340, 'The best South Indian restaurant in Cincinnati, Ohio. We specialize in providing south Indian food buffet with authentic south Indian cuisine.', 
'513-770-0444', 'Our dining room will remain open as long as it is safe for our staff and customers. Masks and gloves will be worn. We also offer delivery and carry out.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3087.1584026011824!2d-84.320462248551!3d39.30733277940891!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840575f35c685bd%3A0x614f45e9ed87ba03!2sGodavari%20Cincinnati!5e0!3m2!1sen!2sus!4v1597257676878!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (350, 'At Raja India we offer distinctive cuisine in an informal, friendly setting.', '513-770-0500', 'We are experts in planning parties, buffets, intimate
business luncheons or family reunions. Therefore, we are experts in keeping our staff and customers safe even in large groups. We will be properly social distancing,
sanitizing and wearing masks.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3085.159906748462!2d-84.33521714854996!3d39.3526152794024!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884059de28b00439%3A0xa67971ad3b43b0f2!2sRaja%20India%20Restaurant!5e0!3m2!1sen!2sus!4v1597257707756!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (360, 'At Basil Thai Bistro, we pride ourselves on serving tradition Thai food!', '513-530-0899', 'We are now open for social-distanced dine-in, reservation only.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3088.769105028572!2d-84.3763205485518!3d39.27080517941432!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840515e3439dd61%3A0xb1834809a9c1f0b2!2sBasil%20Thai%20Bistro!5e0!3m2!1sen!2sus!4v1597257732632!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (370, 'Red Squirrel is a family-owned, diner-style restaurant. Our famous "original" sandwiches are considered the best in the city of Cincinnati.', '513-741-4800',
'We are back to regular business hours and dine-in is now open! We are completing a re-model and extensive safety training for our entire staff. Come check us out!',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3090.974957084426!2d-84.58927514855294!3d39.22073447942164!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404a94a2c37ceb%3A0x6090363b800f003!2sRed%20Squirrel!5e0!3m2!1sen!2sus!4v1597257759929!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (380, 'Mexican restaurant with a full bar, best margaritas, happy hour every day, street tacos!', '513-923-3400', 'We will be remaining closed for the duration
of thi pandemic in an effort to help prevent the spread of Covid-19.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3090.6703929011646!2d-84.59068964855284!3d39.22765097942054!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404a8d9500bcaf%3A0x2b3b74c396c63f17!2sLos%20Panchos%20Mexican%20Restaurant!5e0!3m2!1sen!2sus!4v1597257781126!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (390, 'We are committed to have the best service with the best fresh ingredients. Now just at the tip of your fingers, you can customize your own hibachi/poke
bowl and sushi roll.', '513-923-9888', 'Our team members ensure to give you the best food service while also keeping you safe, and following all federal regulations.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d98798.18957561522!2d-84.50603136458506!3d39.30087111477951!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840593140213a27%3A0x9ef4be2545c1f3cc!2sFusabowl!5e0!3m2!1sen!2sus!4v1597257853809!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (400, 'Strip mall eatery serving breakfast, lunch, baked goods and espresso drinks in modest surroundings.', '513-741-1333', 'Thanks for all your support during this
difficult time! We are open and serving our full menu with curbside pick up and patio dining.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3090.5337350035034!2d-84.63278894855272!3d39.230754079420166!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88403510f799dd11%3A0xa96a393b38fca1f9!2sTags%20Cafe%20%26%20Catering%20LLC!5e0!3m2!1sen!2sus!4v1597257926786!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (410, 'Serving authentic Sichuan Chinese food since 2006.', '513-770-3123', 'We are BACK and ready to serve you some delicious Chinese cuisine. Open as usual for
carry-out, DoorDash and UberEats. Please support us through these tough times. Thank you!',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.397751629995!2d-84.31380854855058!3d39.32457297940656!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840570a793cd017%3A0x22b5ac849b1bd9fa!2sSichuan%20Bistro!5e0!3m2!1sen!2sus!4v1597257955537!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (420, 'Curb your cravings with some of your Rusty Bucket faves!', '513-330-0150', 'All Rusty Bucket Restaurant and Tavern locations will be requiring guests to wear masks
or appropriate face coverings when entering and exiting our locations and in all common areas of the restaurant.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d49382.36776287976!2d-84.34673038359476!3d39.32456768695393!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405701b559a041%3A0xfc3ae0b6b54a8c9!2sRusty%20Bucket%20Restaurant%20and%20Tavern!5e0!3m2!1sen!2sus!4v1597258032541!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (430, 'Humble eatery dishing up generous portions of standard Chinese dishes in unpretentious surrounds.', '513-522-2212', 'During the pandemic we will be enforcing
all regulations such as mask requirements and sanitization guide lines.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3091.071171772887!2d-84.58756394855297!3d39.2185492794219!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404a94d699edb1%3A0x722cd426f23a5e5e!2sChina%20Chef!5e0!3m2!1sen!2sus!4v1597258087195!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (440, 'At Pitrellis, we pride ourselves in serving only authentic Italian cuisine and we work hard to offer a great selection of wines.', '513-770-0122', 'For the duration
of the pandemic we will remain carry-out only.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3084.872846932896!2d-84.31648814854982!3d39.35911597940156!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884059d283c213af%3A0xaa4ab2a0c5fc8dce!2sPitrellis!5e0!3m2!1sen!2sus!4v1597258117511!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (450, 'Taziki''s Mediterranean Café is a fast casual chain of franchised restaurants that purveys Greek and Mediterranean cuisine such as gyros, sandwiches, soups, and salads.',
'513-234-9099', 'Serving our guests safely is our top priority at Taziki''s. 💚 We are doubling down on our current health and safety protocols to ensure our customers can still enjoy their Taziki''s favorites, by ordering online!',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3087.567498329543!2d-84.31671404855123!3d39.29805797941025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884056f851e6a71b%3A0xe14667a5f65eee87!2sTazikis%20Mediterranean%20Cafe%20-%20Deerfield!5e0!3m2!1sen!2sus!4v1597258156372!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (460, 'Kabuto Japanese Steakhouse & Sushi Bar serves a wide selection of traditional Japanese cuisine including sushi and sashimi, hibachi grilled
entrees and a variety of salads and appetizers.', '513-741-7222', 'We are open for both dine-in and carry-out now. We will not be serving lunch during this pandemic.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3089.99837382096!2d-84.59830884855242!3d39.24290857941837!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404a64a1531681%3A0x7345a75229583d20!2sKabuto%20Japanese%20Steakhouse%20%26%20Sushi%20Bar!5e0!3m2!1sen!2sus!4v1597258197093!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (470, 'From our world famous Orange Chicken to our health-minded Wok Smart™ selections, Panda Express defines American Chinese cuisine with bold flavors and fresh
ingredients. Freshly prepared. Every day.', '513-229-8379', 'As companies, communities and individuals across the globe stand together to navigate these uncertain times,
we remain steadfast at Panda Express in our commitment to care for and humbly serve you — our valued guests — as guided by our mission and values as a family business.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d24690.007912885267!2d-84.33447562663153!3d39.327898631969425!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884056f927c8e717%3A0x683fe07854b0ab65!2sPanda%20Express!5e0!3m2!1sen!2sus!4v1597258261996!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (480, 'Simple Thai place offering curries & noodle dishes.', '513-759-9999', 'During this pandemic we will be operating with shorter hours, social distancing,
limited seating and face-mask requirements.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3084.927871242438!2d-84.39774504854991!3d39.357869979401606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405a7dfac84bd7%3A0x828273891e973ec0!2sThai%20Taste%20of%20West%20Chester!5e0!3m2!1sen!2sus!4v1597258293649!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (490, 'Here at Dancing Roll we provide you with the freshest ingredients in a hip atmosphere. The sushi is always half-priced dine-in or carry out.',
'513-755-6800', 'We will be officially reopened July 8th.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3085.1831146119926!2d-84.36929464854997!3d39.352089679402496!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405a08f7ab392d%3A0xe5c2ed811ef4ff90!2sDancing%20Roll-%20West%20Chester!5e0!3m2!1sen!2sus!4v1597258324522!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (500, 'We created Tikka Grill to share our love of the Mediterranean’s delicious flavors, wholesome ingredients, and bright spices. We take pride in
using our traditional cooking techniques and the highest quality ingredients to make a delicious food.', '513-777-3237', 'We have temporarily closed our dining area but are
still here to serve you orders to-go. We apologize for any inconvenience.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3085.4212583868098!2d-84.39839104855015!3d39.34669597940324!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405080ab37e985%3A0xe1bb10e0506d5cda!2sTikka%20Grill!5e0!3m2!1sen!2sus!4v1597258375041!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (510, 'Welcome to the Soho Japanese Bistro. Elegant dining, distinctive food and impeccable service, in a casual to upscale atmosphere.', '513-759-6876',
'Starting May 27th, Soho Japanese Bistro is officially OPEN for dining and available for carrying out and deliveries!',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3085.020901401175!2d-84.36588704854992!3d39.35576327940198!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405a06f1bfcc1f%3A0x9e17de6a72d58a6c!2sSoho%20Japanese%20Bistro!5e0!3m2!1sen!2sus!4v1597258405417!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (520, 'Welcome to Indian Fusion where we serve Lentil Soup, Chapati, Chana Masala, and more!', '513-499-2023', 'Our dining room is open. We have a rigorous
safety program in place, including comfortable spaces for safe dining, sanitized common touch points, and wellness checks + masks for team members.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3085.1098870913274!2d-84.46449834854992!3d39.35374807940231!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404f1d50764049%3A0xf0f8d8476fa207fc!2sIndian%20Fusion%20Restaurant!5e0!3m2!1sen!2sus!4v1597258485621!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (530, 'Our Mexican restaurant is known for its modern interpretation of classic dishes and its insistence on only using high quality fresh ingredients.',
'513-805-7854', 'Due to the current situation we will remain open for carry out only.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3085.6923285051353!2d-84.46217094855028!3d39.34055577940409!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88404ff3dedf7a15%3A0x523ce4be77f05d16!2sMi%20Burrito%20Mexican%20Grill!5e0!3m2!1sen!2sus!4v1597258592079!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (540, 'Authentic Greek Restaurant, Voted Best in Cincinnati', '513-755-0600', 'During the pandemic we have decided to remain carry out only for the safety of our family,
staff and customers.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3084.1187256309076!2d-84.38399414854945!3d39.376189379399044!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405a438f5940c5%3A0x3039c94b76c057e0!2sGreek%20Isles%20Restaurant!5e0!3m2!1sen!2sus!4v1597258640534!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (550, 'Bucks Tavern prides itself on offering up the freshest of everything. Homemade chili, hand patted burgers and even hand breaded chicken tenders.',
'513-677-3511', 'We are back to our regularly scheduled business hours. Thank you for your support during this time!',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3087.3200603934047!2d-84.28414994855109!3d39.30366797940957!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405632c8489b83%3A0xc42f4017168772c2!2sBucks%20Tavern!5e0!3m2!1sen!2sus!4v1597258677527!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (560, 'Our founders had a vision of a fun and funky Tex-Mex restaurant that served authentic and fresh food in an atmosphere that appealed to everyone. From these
humble beginnings Chuys was born.', '513-779-2489', 'A big thank you to our amazing Chuys fans who have supported us during this challenging time. We are starting to open
our dining rooms. The health and safety of our employees and customers remains our top priority. Whether you choose to eat at our restaurant or continue to order for pickup
or delivery, we are here for you.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d98794.3309576707!2d-84.35252115281476!3d39.303604907889564!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405030d12d1da5%3A0xdd91918aefd2d77a!2sChuys!5e0!3m2!1sen!2sus!4v1597259032524!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (570, 'Modern Indian eatery dishing up classic tandoori dishes, biryani & curry, coupled with beer & wine.', '513-769-6266', 'As of Monday July 13th we will be starting
our buffet back up - due to safety guidelines we will be adhering to all regulations such as mask requirements and switching out buffet utensils after each use.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3087.768135087618!2d-84.39489894855134!3d39.29350857941096!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840510b91a7b0f1%3A0x8d28c203d3e8dc23!2sNew%20Krishna%20Indian%20Cuisine!5e0!3m2!1sen!2sus!4v1597259060554!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (580, 'Maggianos Little Italy is an American casual dining restaurant chain specializing in Italian-American cuisine.', '513-794-0670', 'In these hard times we would like
to ask our customers to stay safe, healthy & full! Order online and pick up your Italian-American favorites today!',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3091.7741835871907!2d-84.37930564855333!3d39.202579579424444!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840533f4dba6b3f%3A0xf4875895f7cb6433!2sMaggianos%20Little%20Italy!5e0!3m2!1sen!2sus!4v1597259088104!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (590, 'The story of Mazunte is a simple one. Initially conceived with a theme influenced by Mexican Street Food, the original conception has never wavered.', '513-785-0000',
'As always, the safety of our staff and customers is our top priority. Due to the pandemic we will be strictly carry-out only, enforcing face mask requirements as well as social
distancing and proper sanitization.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3093.5962674222583!2d-84.40740844855426!3d39.16116347943053!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841ad1992081701%3A0x94a4fa6e8b7ffce9!2sMazunte%20Taqueria!5e0!3m2!1sen!2sus!4v1597259116852!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (600, 'We start with cage free, free roaming, all natural chicken. It’s brined, dredged, then dropped into custom-built fryers. Its got a little kick and is served with our
house made hot honey.', '513-802-5007', 'Starting Friday, May 8 we will be serving up chicken and all the fixins for carryout and delivery at our Mass Ave location.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3095.8142030423533!2d-84.51739404855543!3d39.110699979438!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841b3fdba75b123%3A0x92d89e726d8627b2!2sThe%20Eagle%20OTR!5e0!3m2!1sen!2sus!4v1597259165248!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (610, 'Decorated with black lacquer & gold accents, this family-owned spot offers familiar Chinese cuisine.', '513-871-6888', 'We’re still smiling under our new uniform
addition😷 Thank you for letting us feed your families❤️🥡carry out and curbside service available till 9pm.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59712.58691215506!2d-103.4261891909915!3d20.708734992721876!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8428a8b3c7a3cc39%3A0x118b8cce0eb8a404!2sOriental%20Wok!5e0!3m2!1sen!2sus!4v1597259204229!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (620, 'The idea for Nicholson’s was born from our founder’s passion for all things Great Britain.', '513-564-9111', 'Dear guests: Though we have not had any positive cases of
Covid in our building, we will be temporarily closed until we can reopen to a more normal capacity.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3096.1376771142295!2d-84.51421294855558!3d39.10333557943911!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841b150ab43eeb7%3A0x1fee564a6ab5e976!2sNicholsons%20Tavern%20%26%20Pub!5e0!3m2!1sen!2sus!4v1597259234219!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (630, 'Classic Greek joint serving gyros, salads & other fast fare in no-frills digs since 1976.', '513-471-2100', 'We hope you are staying healthy and safe. We wanted to post a reminder
that for the time being, Sebastians closes at 7:00 pm. Thank you for supporting our business during these times.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d197745.89605214837!2d-84.62846054324919!3d39.247873986776064!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x45f95d6293626f80!2sSebastians!5e0!3m2!1sen!2sus!4v1597259342086!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (640, 'Authentic thai food, BYOB and friendly service.', '513-442-2010', 'OPEN Tuesdays thru Sundays for Carry-Out, since April 21st. Please Stay SAFE ALL!',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3095.716734394815!2d-84.69533984855539!3d39.112918779437436!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841ceab968ffd95%3A0xf54d2e46e79f2a9b!2sBuddha%20Barn%20Thai!5e0!3m2!1sen!2sus!4v1597259384622!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (650, 'Neighborhood watering hole with American pub grub & beer on tap, plus a roomy brick-walled patio.', '513-751-6566', 'During COVID-19 we will be operating at our normal hours while enforcing
social distancing, masks and proper sanitizing.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3094.3786325452934!2d-84.5218987485547!3d39.1433689794329!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841b3871d0b35dd%3A0x6bd1ac614bbf52c2!2sArlins%20Bar%20%26%20Restaurant!5e0!3m2!1sen!2sus!4v1597259432800!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (660, 'Montgomery Inn is a barbecue restaurant chain based in the Cincinnati suburb of Montgomery, Ohio, United States. It is best known for its specialty, loin back ribs, and the barbecue sauce
used in preparation and serving.', '513-791-3482', 'We very much appreciate your continued support during this COVID-19 crisis. We look forward to seeing you again at the restaurant and appreciate your
support of our new safe in-restaurant practices.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3090.6873781692966!2d-84.35643014855277!3d39.22726527942053!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88405380735972ab%3A0x224988c26133a39a!2sMontgomery%20Inn%20The%20Original!5e0!3m2!1sen!2sus!4v1597259469876!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (670, 'Our mission is to capture the fun and enthusiasm of an authentic Italian gathering along with delectable food. Every Buca di Beppo restaurant offers an eclectic setting designed to make every
occasion a party', '513-396-7673', 'The full Buca menu is available To Go, and many locations offer Curb Service. At select locations you may place a To Go order online through our online ordering system.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3094.1625001902407!2d-84.44780114855456!3d39.1482854794323!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8841b2870d307ac9%3A0x87d4d5d37c556e5d!2sBuca%20di%20Beppo%20Italian%20Restaurant!5e0!3m2!1sen!2sus!4v1597259570456!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (680, 'Whether you are seeking a selection of Indian food or would like to enjoy some savory Indian Sweets, our restaurant has great options for all of our customers.', '513-755-2876',
'Swagat India House makes sure that you can enjoy the authentic flavors of our traditionally prepared Indian food in the comfort of your own home with our takeout service.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.563771058161!2d-84.36968234855073!3d39.320810679406904!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884050c4e1cf558d%3A0xe8a74a788d923400!2sSwagat%20India%20House!5e0!3m2!1sen!2sus!4v1597259637633!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (690, 'Authentic Thai and sushi spot located conveniently in the Cincinnati area.', '513-271-8424', 'During these uncertain times, we will be remaining strictly carry out and delivery.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.967849156755!2d-84.31769594855089!3d39.31165227940824!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840571cbbe5b5b1%3A0x44535876c092d2a8!2sThai%20Spicy!5e0!3m2!1sen!2sus!4v1597259772484!5m2!1sen!2sus')

INSERT INTO restaurant_details (restaurant_id, restaurant_description, restaurant_phonenumber, covid_message, map_url)
VALUES (700, 'Step into Bravo and experience the amazing homemade Italian inspired recipes. From pastas, to brick oven pizzas, to fresh salads, to perfectly charred grill items.', '513-234-7900', 'We are offering
patio dining and carry out at select locations.',
'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d98892.22607238991!2d-84.44976416618242!3d39.2341978247288!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8840570034b47f13%3A0x98f008b5d0f6d543!2sBravo*21%20Italian%20Kitchen!5e0!3m2!1sen!2sus!4v1597261950901!5m2!1sen!2sus')




CREATE TABLE restaurant_reviews (
	review_id int IDENTITY (5, 5) NOT NULL PRIMARY KEY,
	restaurant_id int NOT NULL,
	restaurant_review varchar(250),
	restaurant_star_rating int NOT NULL
)


INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (10, 'Higher quality meat than a typical hole in the wall chinese place. Delicious!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (20, 'Great place, great people, great service, great food!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (30, 'Comfort food, reasonable prices and good service.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (40, 'Always great food and always super friendly staff/service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (50, 'Excellent food and service, great place for birthday party!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (60, 'Good food, friendly service, and tasty margaritas!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (70, 'The atmosphere was very cool, a bit edgy in a cool and intimate setting.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (80, 'Best indian food in town!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (90, 'Fantastic selection of beer/wine, good food, and good service.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (100, 'Great service, love the breadsticks and salad.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (110, 'Great food, great service, and a wide variety of dishes to choose from.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (120, 'Better sauces and queso than the other burrito chains.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (130, 'The menu was plentiful, huge selection.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (140, 'Big variety of food experiences.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (150, 'Very fresh and tasty, high quality ingredients and excellent service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (160, 'Omg I just had the best piada experience!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (170, 'The atmosphere, the menu and staff make this a great choice!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (180, 'Great place for family dinner, friends, small groups, kids or casual date!', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (190, 'Really good Thai food for good prices.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (200, 'I would choose this location over other Thai places in the area.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (210, 'Upscale Chinese that we really enjoy!', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (220, 'Very good service, reasonable price and uality of food!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (230, 'I enjoyed the swift customer service and well cooked dishes.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (240, 'The staff and decor along with the beer selection make this an experience.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (250, 'A must visit place! Try the fish and chips, or the chicken nachos.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (260, 'This place is always great; the food and service!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (270, 'Very nice staff and clean environment, tasty combo meals.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (280, 'Personable staff, good food, cold drinks good service.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (290, 'Great catfish, fresh and fast! Friendly staff and excellent service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (300, 'Both food and service were great!', 3);

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (310, 'They gave me ketchup without asking, extra napkins and hot food. Very happy!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (320, 'Great location, awesome people, affordable prices and excellent food!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (330, 'Fantastic atmosphere and tasty dishes.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (340, 'They had variety of items in buffet, ambience is good and staff were welcoming.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (350, 'Very tasty lunch buffet with a wide variety of entrees and side dishes.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (360, 'The food is great, the staff is friendly, the prices are reasonable, and BYOB!', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (370, 'Good service, decent food, prices comparable to other restaurants like it.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (380, 'Always great prices, great food, good service, and served quickly.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (390, 'Excellent meals, creative chef de cuisine, decent pay and excellent service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (400, 'Great food great staff makes you feel refreshed in the morning after work.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (410, 'Clean interior, fresh ingredients, proper seasoning, friendly staff.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (420, 'The service is constantly quick, great ambience, very kind staff members.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (430, 'Great food, good prices, and fast and friendly service.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (440, 'Wonderful food, great service, intimate atmosphere, good wine selection', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (450, 'Very good food, served quickly, ample portions, friendly service.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (460, 'Excellent ambience, flavorful dishes, great service.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (470, 'Great food, friendly service, reasonably priced, good portions.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (480, 'Very generous portions and fair price. Fresh and the best I can find lately.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (490, 'Great food, atmosphere, staff, and prices.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (500, 'This was my first time here and the employees were awesome.  The food was outstanding.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (510, 'Great Service, Great Food, Clean Restaurant, Fast, Calm Environment.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (520, 'Lovely interior, fabulous service and great taste (good prices, too.)', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (530, 'Finest food, kind staff members, always fantastic vibes.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (540, 'The experience at this place beats going to chain restaurants.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (550, 'Excellent food, prompt service, nice atmosphere, and appropriate prices.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (560, 'Food was delicious, Salsa is a bit spicy but still yummy.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (570, 'The drinks and food served quickly and the prices were fair.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (580, 'Best place to eat Italian food for your money.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (590, 'Delicious food, superb margaritas, great service, and an authentic Mexican vibe.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (600, 'Dog friendly, great location, fair price, great staff and amazing sandwiches!', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (610, 'The customer service is regularly fast, good ambience, super friendly staff.', 3)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (620, 'The service is always rapid, lovely vibes, very kind staff.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (630, 'Prices are right, service is friendly and the food cannot be beat.', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (640, 'Its a small place but service was good and food was excellent.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (650, 'Good ambience, amazing patio nice beer menu and very tasty food.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (660, 'Service and food A+ friendliest staff', 5)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (670, 'The food is amazing to say the least and the staff is amazing, too.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (680, 'Anyone who enjoys a well executed Indian buffet should check this place out.', 4)

INSERT INTO restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (690, 'Good flavor and portion size, casual atmosphere.', 3)

INSERT into restaurant_reviews (restaurant_id, restaurant_review, restaurant_star_rating)
VALUES (700, 'Good service, decent food and drinks, relaxed and rarely a wait.', 4);


CREATE TABLE user_favorites (
	user_id int NOT NULL,
	restaurant_id int NOT NULL,
	number_of_times_visited int
)

INSERT INTO user_favorites (user_id, restaurant_id)
VALUES (1, 10);
INSERT INTO user_favorites (user_id, restaurant_id)
VALUES (1, 50);
INSERT INTO user_favorites (user_id, restaurant_id)
VALUES (1, 100);

CREATE TABLE previously_visited_restaurants (
	user_id int NOT NULL,
	restaurant_id int NOT NULL
)

CREATE TABLE user_account (
	user_id int NOT NULL,
	user_zip varchar (9) NOT NULL,
	CONSTRAINT PK_user_account PRIMARY KEY (user_id)
)

INSERT INTO user_account (user_id, user_zip)
VALUES (1, 45040);

CREATE TABLE user_favorited_types (
	type_id int NOT NULL,
	user_id int NOT NULL
)


INSERT INTO user_favorited_types (type_id, user_id)
VALUES (4, 1)


CREATE TABLE restaurants_and_their_types (
	restaurant_id int NOT NULL,
	type_id int NOT NULL
)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (10, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (20, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (30, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (40, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (50, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (60, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (70, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (80, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (90, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (100, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (110, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (120, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (130, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (140, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (150, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (160, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (170, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (180, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (190, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (200, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (210, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (220, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (230, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (240, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (250, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (260, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (270, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (280, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (290, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (300, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (310, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (320, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (330, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (340, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (350, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (360, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (370, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (380, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (390, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (400, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (410, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (420, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (430, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (440, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (450, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (460, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (470, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (480, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (490, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (500, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (510, 10)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (520, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (530, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (540, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (550, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (560, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (570, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (580, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (590, 4)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (600, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (610, 12)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (620, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (630, 6)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (640, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (650, 16)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (660, 2)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (670, 14)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (680, 18)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (690, 8)

INSERT INTO restaurants_and_their_types (restaurant_id, type_id)
VALUES (700, 14);



ALTER TABLE restaurants_and_their_types
ADD FOREIGN KEY (type_id)
REFERENCES restaurant_type(type_id);

ALTER TABLE restaurants_and_their_types
ADD FOREIGN KEY (restaurant_id)
REFERENCES restaurants(restaurant_id);

ALTER TABLE restaurant_reviews
ADD FOREIGN KEY(restaurant_id)
REFERENCES restaurants(restaurant_id);

ALTER TABLE user_favorites
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id);

ALTER TABLE user_favorites
ADD FOREIGN KEY(restaurant_id)
REFERENCES restaurants(restaurant_id);

ALTER TABLE user_favorited_types
ADD FOREIGN KEY(type_id)
REFERENCES restaurant_type(type_id);

ALTER TABLE user_favorited_types
ADD FOREIGN KEY(user_id)
REFERENCES users(user_id);