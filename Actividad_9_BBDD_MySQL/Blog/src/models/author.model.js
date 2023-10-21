const getAllAuthors = () =>{
    return db.query('SELECT * FROM authors');
}

 const selectAuthorById = (id) =>{
    return db.query('SELECT * FROM authors WHERE id = ?', [id])
 }

const insertAuthor = ({name, email, image})=>{
    return db.query(
        'INSERT INTO authors (name, email, image) values(?,?,?)', [name, email, image] )
}

const updateAuthorById = (id, {name, email, image}) => {
    return db.query('UPDATE authors SET name=?, email=?, image=? WHERE id=?',
    [name, email, image, id]    )
}

const deleteAuthorById = (id) => {
    return db.query('DELETE FROM authors WHERE id=?', [id])
}

module.exports = {getAllAuthors, selectAuthorById, insertAuthor, updateAuthorById, deleteAuthorById }