CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "membership" varchar,
  "location" varchar,
  "memberships_id" serial
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "users_id" uuid,
  "courses_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level" char(3),
  "teacher" varchar,
  "certification" bool,
  "duration" varchar,
  "course_videos_id" uuid
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "length" int,
  "subtitles" bool
);

CREATE TABLE "course_videos__languages" (
  "id" uuid PRIMARY KEY,
  "course_videos_id" uuid,
  "languages_id" serial
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "courses_id" uuid
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "department" varchar,
  "users_id" uuid
);

CREATE TABLE "memberships" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "payment_method" varchar,
  "billing" varchar
);

CREATE TABLE "languages" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("course_videos_id") REFERENCES "course_videos" ("id");

ALTER TABLE "course_videos__languages" ADD FOREIGN KEY ("course_videos_id") REFERENCES "course_videos" ("id");

ALTER TABLE "course_videos__languages" ADD FOREIGN KEY ("languages_id") REFERENCES "languages" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("memberships_id") REFERENCES "memberships" ("id");

ALTER TABLE "roles" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");



//* CREATE */

/* CATEGORIES */
insert into categories (name) values ('marketing');

update categories 
set courses_id = 'da3d50be-f058-415e-9fbb-363fe3679eaa'
where id = 3;



/* USERS */
insert into users (
 id, 
 name, 
 email, 
 "password", 
 age, 
 membership,
 location,
 memberships_id 
 ) values (
 'efe62efa-d353-4749-860b-c6d542a340b8',
 'Maria lopez',
 'maria19@cursos.com',
 '000009',
 '35',
 'expired',
 'Panama',
 '3'
 );

update users 
set membership = 'active'
where id = '80f61646-7747-42d5-99fa-e003b0a45b48';


/* MEMBERSHIPS */

insert into memberships (
 name, 
 payment_method,
 billing 
) values (
 'Platinum',
 'credit card',
 '18/11/2022'
), (
 'gold',
 'gift card',
 'anually'
)

update memberships 

set billing = 'monthly'
where id = '1';

delete from memberships where id = '2';


/*COURSE_VIDOE */

insert into course_videos (
 id,
 title,
 url,
 length,
 subtitles
) values (
 '104d109b-106d-46e8-ab5c-121d8a6a5af5', 
 'fundaments of python',
 'https://docs.python.org/3/',
 6,
 true
), (
  '48b9e3bd-57d1-484c-99a9-ebbb9b3b5b55',
  'why learn about marketing?',
  'https://www.udemy.com/courses/marketing/digital-marketing/',
  3,
  false
);

/* LANGUAGES */ 

insert into languages (
  name
)values(
 'English'
), (
 'Spain'
), (
 'Chinese'
)

/* COURSES */
insert into courses (
  id, 
  title, 
  description,
  level,
  teacher,
  certification,
  duration,
  course_videos_id
) values (
 '85e1f0dd-fd3a-4f54-94ba-bf0c4f30d1aa',
 'back-end with python',
 'The backend of a website can be written in many different programming languages. It is becoming increasingly common for to use Python for the backend of a website.',
 'BNG',
 'Beau Carnes',
  true,
  '2 months',
  '104d109b-106d-46e8-ab5c-121d8a6a5af5'
), (
  'da3d50be-f058-415e-9fbb-363fe3679eaa',
  'website marketing',
  'Digital marketing, also called online marketing, refers to all marketing efforts that occur on the internet. Businesses leverage digital channels such as search engines, social media, email, and other websites to connect with current and prospective customers',
  'ADV',
  'Margrethe Vercingetorix',
  true,
  '6 months',
  '48b9e3bd-57d1-484c-99a9-ebbb9b3b5b55'
)

/*  COURSE_VIDEOS_LANGUAGES*/
 insert into course_videos__languages (
   id,
   course_videos_id,
   languages_id
 ) values (
   '0bc57561-79ee-44b7-9787-fbae35089158',
   '104d109b-106d-46e8-ab5c-121d8a6a5af5',
   1
 ), (
   '2d9684df-f93e-4773-a6ea-ed6cdc7dbb3f',
   '48b9e3bd-57d1-484c-99a9-ebbb9b3b5b55',
   2
 );


/* ROLES  */

insert into roles (
 name,
 department,
 users_id
) values (
 'admin',
 'QA',
 '80f61646-7747-42d5-99fa-e003b0a45b48'
), (
 'student',
 'general',
 'efe62efa-d353-4749-860b-c6d542a340b8'
)

/* USERS_COURSES */

insert into users_courses (
 id,
 users_id,
 courses_id
) values (
 'f002cf7d-d531-4690-ba2c-c13b16da8f38',
 '80f61646-7747-42d5-99fa-e003b0a45b48',
 '85e1f0dd-fd3a-4f54-94ba-bf0c4f30d1aa'
), (
  '2183cbc7-a356-405a-bc0b-f34f0e1c1309',
  'efe62efa-d353-4749-860b-c6d542a340b8',
  'da3d50be-f058-415e-9fbb-363fe3679eaa'
)