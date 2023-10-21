/*Authors*/
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Pablo Nevares', 'pnevarez@gmail.com', 'https://plus.unsplash.com/premium_photo-1682432836046-baf51d79b416?auto=format&fit=crop&q=80&w=1170&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Ericka Vault', 'eVault@gmail.com', 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&q=80&w=1288&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Niccholas Chen', 'nchen@yahoo.com', 'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?auto=format&fit=crop&q=80&w=1287&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Rahul Varun', 'rvarun78@gmail.com', 'https://plus.unsplash.com/premium_photo-1682088935745-089fbb1dc447?auto=format&fit=crop&q=80&w=1170&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Marco Smith', 'msmith@gmail.com', 'https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&q=80&w=1287&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Viktor Tahoe', 'vtahoe@gmail.com', 'https://images.unsplash.com/photo-1507206130118-b5907f817163?auto=format&fit=crop&q=80&w=1287&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Manuella Smith', 'mansmith@gmail.com', 'https://images.unsplash.com/photo-1573497019418-b400bb3ab074?auto=format&fit=crop&q=80&w=1287&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Chris Banks', 'cbanks@gmail.com', 'https://plus.unsplash.com/premium_photo-1661778981410-7d020225a102?auto=format&fit=crop&q=80&w=1170&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Sabino Cors', 'scors@yahoo.com', 'https://images.unsplash.com/photo-1600275669283-4bf2bb8a990c?auto=format&fit=crop&q=80&w=1287&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
INSERT INTO `blogs`.`authors` (`name`, `email`, `image`) VALUES ('Rick Chen', 'rchen@hotmail.com', 'https://images.unsplash.com/photo-1576078855245-301a0bf949cb?auto=format&fit=crop&q=80&w=1331&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');


/*Blogs*/
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Java Future', 'Java is not dead and has a brilliant future', 'Programming', '3');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Python in a nutshell', 'Python has reached the highest rank ...', 'Programming', '3');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Cyber Security Tips', 'CyberSecurity is not just a hot topic ....', 'IT Security', '5');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Angular vs React Battle', 'Angular & React all the way ...', 'Front End Framworks', '3');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('HTML 5 revolution', 'HTML 5 more powerful than ever', 'Front End Development', '6');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Money trap', 'Quick Money is not the solution', 'Finance', '4');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('MongoDB rocks', 'MongoDB has become the solution ...', 'Programming', '3');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Crypto Money scam?', 'Is the trend of Crypto Money ...', 'Finance', '7');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Angular new Releas', 'Angular New Release is cool ...', 'Front End Frameworks', '3');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('NextJS power', 'NextJS is making its way up ! ...', 'Front End Frameworks', '2');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('SQL vs NoSQL debate', 'How heated is this battle! ...', 'Databases', '7');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Understanding DML', 'Data Manipulation is the ! ...', 'Databases', '9');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('CSS Animations', 'Animations are graphically strong...', 'Front End Development', '3');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Tailwind magic', 'Tailwind has changed the way ...', 'Front End Development', '10');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Bootstrap vs Bulma', 'This is a non stop debate...', 'Front End Development', '11');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('PureCSS on its way', 'PureCSS is catching up...', 'Front End Development', '2');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('OracleDB is expensive but the best', 'It is known that Oracle DB is...', 'Databases', '11');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Indexes are lifesafers', 'Indexing Fields is simply...', 'Databases', '6');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Digital Products with NextJS', 'Medusa and NextJS are...', 'Front End Frameworks', '3');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Blazor Routing', 'Blazor has made it to the race...', 'Front End Frameworks', '3');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('MongoDB Atlas', 'Used with Python, Java and more...', 'DataBases', '10');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Managing Java on MacOS', 'Java leaking can be fixed...', 'Programming', '6');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Secrets of the Cloud', 'Cloud Computing has a lot of...', 'Cloud Computing', '9');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('Go Programming and more', 'Go has reach a good level...', 'Programming', '10');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('ChatGPT vs Bear', 'What is better among...', 'Artificial Intelligence', '3');
INSERT INTO `blogs`.`posts` (`title`, `description`, `category`, `authors_id`) VALUES ('ChatGPT Accuracy', 'Accuracy has dropped?...', 'Artificial Intelligence', '11');

