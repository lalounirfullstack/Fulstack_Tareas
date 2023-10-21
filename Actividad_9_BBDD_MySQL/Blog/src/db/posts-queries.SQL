/***************************************
              > POSTS <
 ***************************************/
/*ALL Posts*/
SELECT * FROM blogs.posts;

/*Post by a Given Author*/
SELECT p.*,
       a.Name
FROM blogs.posts p
JOIN blogs.authors a ON a.id=p.authors_id
WHERE p.authors_id=3;

/*Post By a given Category*/
SELECT p.*,
       a.Name
FROM blogs.posts p
JOIN blogs.authors a ON a.id=p.authors_id
WHERE p.category='Programming';