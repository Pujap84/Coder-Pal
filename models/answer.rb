def question_id(id)
    run_sql("SELECT * FROM questions WHERE id=$1", [id])
end

def create_question(title, body, votes, user_id)
    sql_query = "INSERT INTO questions (title, body, votes, user_id) VALUES ($1, $2, $3, $4);"; 
    params = [title, body, votes, user_id]
    run_sql(sql_query, params)
end

